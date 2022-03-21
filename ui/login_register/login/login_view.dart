import 'package:pessa_flow/common/common.dart';
import 'package:pessa_flow/common/validator.dart';
import 'package:pessa_flow/constants/route.dart';
import 'package:pessa_flow/generated/l10n.dart';
import 'package:pessa_flow/model/model.dart';
import 'package:pessa_flow/network/base_api_service.dart';
import 'package:pessa_flow/pref/app_pref.dart';
import 'package:pessa_flow/res/colors.dart';
import 'package:pessa_flow/res/images.dart';
import 'package:pessa_flow/ui/common_views/registration_header_view.dart';
import 'package:pessa_flow/ui/login_register/password_recovery/password_recovery_view.dart';
import 'package:pessa_flow/ui/login_register/register/register_view.dart';
import 'package:pessa_flow/utils/app_logger.dart';
import 'package:pessa_flow/utils/base_cubit.dart';
import 'package:pessa_flow/utils/input_formatters.dart';
import 'package:pessa_flow/widgets/common_app_bar.dart';
import 'package:pessa_flow/widgets/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pessa_flow/extensions/extension.dart';

part 'login_cubit.dart';

part 'login_state.dart';
part  'login_service.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    var initialState = BlocProvider.of<LoginCubit>(context).state;
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Container(
        decoration: const BoxDecoration(color: AppColor.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RegistrationHeaderView(
                title: S.of(context).loginTitle,
                subTitle: S.of(context).loginSubTitle,
              ),
              Material(
                elevation: 0.0,
                color: AppColor.primary,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(24.0,16.0, 24.0, context.bottomPadding + 96),
                  child: Form(
                    key: initialState.formKey,
                    child: Column(
                      children: [
                        const SizeBoxH(48),
                        CommonTextField(
                          controller: initialState.phoneController,
                          labelText: S.of(context).email,
                          labelColor: AppColor.white,
                          hintText: S.of(context).enterEmailAddress,
                          keyboardType: TextInputType.emailAddress,
                          focus: initialState.phoneFocus,
                          validator: validateEmail,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(16),
                            child: BlocBuilder<LoginCubit, LoginState>(
                              buildWhen: (previous, current) => previous.isPhoneFocused != current.isPhoneFocused,
                              builder: (context, state) {
                                return SquareSvgImageFromAsset(
                                  AppImage.phone,
                                  size: 20,
                                  color: state.isPhoneFocused ? AppColor.white : AppColor.textPrimaryMedium,
                                );
                              },
                            ),
                          ),
                        ),
                        const SizeBoxH(36),
                        CommonTextField(
                          controller: initialState.passwordController,
                          labelText: S.of(context).password,
                          hintText: S.of(context).password,
                          keyboardType: TextInputType.visiblePassword,
                          focus: initialState.passwordFocus,
                          labelColor: AppColor.white,
                          validator: validatePassword,
                          obscure: true,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(16),
                            child: BlocBuilder<LoginCubit, LoginState>(
                              buildWhen: (previous, current) => previous.isPasswordFocused != current.isPasswordFocused,
                              builder: (context, state) {
                                return SquareSvgImageFromAsset(
                                  AppImage.password,
                                  size: 20,
                                  color: state.isPasswordFocused ? AppColor.white : AppColor.textPrimaryMedium,
                                );
                              },
                            ),
                          ),
                        ),
                        const SizeBoxH(12),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Text.rich(
                              TextSpan(
                                text: S.of(context).forgotPassword,
                                style: const TextStyle(
                                    color: AppColor.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()..onTap = BlocProvider.of<LoginCubit>(context).onForgotTap,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizeBoxH(32),
                        CommonButton(
                          onPressed: BlocProvider.of<LoginCubit>(context).onSignInTap,
                          label: S.of(context).signIn,
                        ),
                        const SizeBoxH(24),
                        CommonButton(
                          onPressed: () => Navigator.of(context).pushNamed(AppRoute.registerScreen),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 2.0, 16, 2.0),
                            child: Text.rich(
                              TextSpan(
                                text: S.of(context).dontHaveAccount + " ",
                                style: const TextStyle(color: AppColor.textPrimary, fontSize: 16, fontWeight: FontWeight.w500),
                                children: [
                                  TextSpan(
                                    text: S.of(context).joinNow,
                                    style: const TextStyle(
                                        color: AppColor.primary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context).pushNamed(AppRoute.registerScreen);
                                      },
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          bgColor: AppColor.white,
                        ),
                        const SizeBoxH(32),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      /*bottomNavigationBar: BottomAppBar(
        child: Material(
          color: AppColor.primary,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Form(
                key: initialState.formKey,
                child: Column(
                  children: [
                    const SizeBoxH(48),
                    CommonTextField(
                      controller: initialState.phoneController,
                      labelText: S.of(context).enterAddress + " / " + S.of(context).phoneNumber,
                      hintText: S.of(context).enterYourPhoneNumber,
                      keyboardType: TextInputType.phone,
                      focus: initialState.phoneFocus,
                      validator: validateMobileNumber,
                      inputFormatters: [NumberInputFormatter(length: 10)],
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16),
                        child: BlocBuilder<LoginCubit, LoginState>(
                          buildWhen: (previous, current) => previous.isPhoneFocused != current.isPhoneFocused,
                          builder: (context, state) {
                            return SquareSvgImageFromAsset(
                              AppImage.phone,
                              size: 20,
                              color: state.isPhoneFocused ? AppColor.white : AppColor.textPrimaryMedium,
                            );
                          },
                        ),
                      ),
                    ),
                    const SizeBoxH(36),
                    CommonTextField(
                      controller: initialState.passwordController,
                      labelText: S.of(context).password,
                      hintText: S.of(context).password,
                      keyboardType: TextInputType.visiblePassword,
                      focus: initialState.passwordFocus,
                      validator: validatePassword,
                      obscure: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16),
                        child: BlocBuilder<LoginCubit, LoginState>(
                          buildWhen: (previous, current) => previous.isPasswordFocused != current.isPasswordFocused,
                          builder: (context, state) {
                            return SquareSvgImageFromAsset(
                              AppImage.password,
                              size: 20,
                              color: state.isPasswordFocused ? AppColor.white : AppColor.textPrimaryMedium,
                            );
                          },
                        ),
                      ),
                    ),
                    const SizeBoxH(),

                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Text.rich(
                          TextSpan(
                            text: S.of(context).forgotPassword,
                            style: const TextStyle(color: AppColor.white, fontSize: 14, fontWeight: FontWeight.w500, decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()..onTap = BlocProvider.of<LoginCubit>(context).onForgotTap,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizeBoxH(32),
                    CommonButton(
                      onPressed: BlocProvider.of<LoginCubit>(context).onSignInTap,
                      label: S.of(context).signIn,
                    ),
                    const SizeBoxH(24),
                    CommonButton(
                      onPressed: () => Navigator.of(context).pushNamed(AppRoute.loginScreen),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 2.0, 16, 2.0),
                        child: Text.rich(
                          TextSpan(
                            text: S.of(context).dontHaveAccount + " ",
                            style: const TextStyle(color: AppColor.textPrimary,  fontSize: 16, fontWeight: FontWeight.w500),
                            children: [
                              TextSpan(
                                text: S.of(context).joinNow,
                                style: const TextStyle(color: AppColor.primary, fontSize: 16, fontWeight: FontWeight.w700 , decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushNamed(AppRoute.loginScreen);
                                  },
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      bgColor: AppColor.white,
                    ),
                    const SizeBoxH(32),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),*/
    );
  }
}
