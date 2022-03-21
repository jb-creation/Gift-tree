import 'package:pessa_flow/extensions/extension.dart';
import 'package:pessa_flow/ui/change_pass/change_pass_view.dart';
import 'package:pessa_flow/ui/faqs/faqs_view.dart';
import 'package:pessa_flow/ui/login_register/login/login_view.dart';
import 'package:pessa_flow/ui/login_register/otp_verification/otp_verification_view.dart';
import 'package:pessa_flow/ui/login_register/password_recovery/password_recovery_view.dart';
import 'package:pessa_flow/ui/login_register/register/register_view.dart';
import 'package:pessa_flow/ui/login_register/reset_password/reset_password_view.dart';
import 'package:pessa_flow/ui/login_register/welcome/welcome_view.dart';

import 'package:pessa_flow/ui/main/main_view.dart';
import 'package:pessa_flow/ui/main/notification/notification_view.dart';
import 'package:pessa_flow/ui/main/profile/account/add_card/add_card_view.dart';
import 'package:pessa_flow/ui/main/profile/profile_view.dart';
import 'package:pessa_flow/ui/notification_settings/notification_settings_view.dart';
import 'package:pessa_flow/ui/splash/splash_view.dart';
import 'package:pessa_flow/ui/transaction/contacts_list/contacts_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pessa_flow/ui/transaction/register_recipient/register_recipient_view.dart';
import 'package:pessa_flow/ui/update_profile/update_profile_view.dart';

class AppRoute {
  AppRoute._();

  static const splashScreen = "/";
  static const loginScreen = "/login_screen";
  static const otpVerificationScreen = "/otp_verification_screen";
  static const passwordRecoveryScreen = "/password_recovery_screen";
  static const resetPasswordScreen = "/reset_password_screen";
  static const registerScreen = "/register_screen";
  static const welcomeScreen = "/welcome_screen";
  static const mainScreen = "/main_screen";
  static const addCardScreen = "/add_card_screen";
  static const notificationScreen = "/notification_screen";
  static const contactsListScreen = "/contacts_list_screen";
  static const changePassword = "/change_password_screen";
  static const faqsScreen = "/faqs_screen";
  static const settingsScreen = "/notification_settings_screen";
  static const profileScreen = "/profile_screen";
  static const profileUpdate = "/profile_update_screen";
  static const registerRecipient = "/register_recipient_screen";

  static const chatScreen = "/chat_screen";

  static Map<String, WidgetBuilder> get listRoutes => {
        splashScreen: (ctx) => const SplashView(),
        loginScreen: (ctx) => BlocProvider(
              create: (context) => LoginCubit(context),
              child: const LoginView(),
            ),
        otpVerificationScreen: (ctx) => BlocProvider(
              create: (context) => OtpVerificationCubit(
                  context, ctx.args as Map<String, dynamic>),
              child: const OtpVerificationView(),
            ),
        passwordRecoveryScreen: (ctx) => BlocProvider(
              create: (context) => PasswordRecoveryCubit(context),
              child: const PasswordRecoveryView(),
            ),
        resetPasswordScreen: (ctx) => BlocProvider(
              create: (context) => ResetPasswordCubit(context),
              child: const ResetPasswordView(),
            ),
        registerScreen: (ctx) => BlocProvider(
              create: (context) => RegisterCubit(context),
              child: const RegisterView(),
            ),
        welcomeScreen: (ctx) => const WelcomeView(),
        mainScreen: (ctx) => BlocProvider(
              create: (context) => MainCubit(context),
              child: const MainView(),
            ),
        addCardScreen: (ctx) => BlocProvider(
              create: (context) =>
                  AddCardCubit(context, ctx.args as Map<String, dynamic>),
              child: const AddCardView(),
            ),
        notificationScreen: (ctx) => BlocProvider(
              create: (context) => NotificationCubit(context),
              child: const NotificationView(),
            ),
        contactsListScreen: (ctx) => BlocProvider(
              create: (context) =>
                  ContactsListCubit(context, ctx.args as Map<String, dynamic>),
              child: const ContactsListView(),
            ),
        changePassword: (ctx) => BlocProvider(
              create: (context) => ChangePassCubit(context),
              child: const ChangePassView(),
            ),
        faqsScreen: (ctx) => BlocProvider(
              create: (context) => FaqsCubit(context),
              child: const FaqsView(),
            ),
        settingsScreen: (ctx) => BlocProvider(
              create: (context) => NotificationSettingsCubit(context),
              child: const NotificationSettingsView(),
            ),
        profileScreen: (ctx) => BlocProvider(
              create: (context) => ProfileCubit(context),
              child: const ProfileView(),
            ),
    registerRecipient: (ctx) => BlocProvider(
              create: (context) => RegisterRecipientCubit(context,ctx.args as Map<String, dynamic>),
              child: const RegisterRecipientView(),
            ),
      };
}
