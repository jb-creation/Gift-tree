import 'package:pessa_flow/common/common.dart';
import 'package:pessa_flow/common/validator.dart';
import 'package:pessa_flow/constants/route.dart';
import 'package:pessa_flow/extensions/extension.dart';
import 'package:pessa_flow/generated/l10n.dart';
import 'package:pessa_flow/model/model.dart';
import 'package:pessa_flow/network/base_api_service.dart';
import 'package:pessa_flow/pref/app_pref.dart';
import 'package:pessa_flow/res/colors.dart';
import 'package:pessa_flow/res/images.dart';
import 'package:pessa_flow/ui/common_views/registration_header_view.dart';
import 'package:pessa_flow/utils/app_logger.dart';
import 'package:pessa_flow/utils/base_cubit.dart';
import 'package:pessa_flow/utils/input_formatters.dart';
import 'package:pessa_flow/widgets/common_app_bar.dart';
import 'package:pessa_flow/widgets/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_cubit.dart';

part 'register_state.dart';
part 'register_service.dart';
class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    var initialState = BlocProvider
        .of<RegisterCubit>(context)
        .state;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Material(
          color: AppColor.transparent,
          child: Column(
            children: [
              SizeBoxH(context.topPadding),
              Expanded(
                child: Row(
                  children: [
                    const SizeBoxV(4),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                        child: CircleImageFromAsset(AppImage.backBlack, size: 42,),
                      ),
                    ),

                    Expanded(
                      child: CommonText.bold(S
                          .of(context)
                          .getStarted, size: 28, color: AppColor.white, textAlign: TextAlign.center),
                    ),
                    const SizeBoxV(48)
                  ],
                ),
              ),
            ],
          )
          ,
        ),
      ),
      backgroundColor: AppColor.primary,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 20 + context.bottomPadding),
        child: Form(
          key: initialState.formKey,
          child: Column(
            children: [
              CommonTextField(
                labelColor: AppColor.white,
                controller: initialState.nameController,
                labelText: S
                    .of(context)
                    .firstName,
                hintText: S
                    .of(context)
                    .enterYourName,
                keyboardType: TextInputType.name,
                focus: initialState.nameFocus,
                validator: (value) => value.isNullOrEmpty ? S.current.pleaseEnterYourName : null,
                inputFormatters: [UsernameInputFormatter()],
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: BlocBuilder<RegisterCubit, RegisterState>(
                    buildWhen: (previous, current) => previous.isNameFocused != current.isNameFocused,
                    builder: (context, state) {
                      return const SquareSvgImageFromAsset(
                        AppImage.name,
                        size: 20,
                        color: AppColor.white,
                      );
                    },
                  ),
                ),
              ),
              const SizeBoxH(16),
              CommonTextField(
                labelColor: AppColor.white,
                controller: initialState.lastNameController,
                labelText: S
                    .of(context)
                    .lastName,
                hintText: S
                    .of(context)
                    .enterYourLastName,
                keyboardType: TextInputType.name,
                focus: initialState.lastNameFocus,
                validator: (value) => value.isNullOrEmpty ? S.current.pleaseEnterYourName : null,
                inputFormatters: [UsernameInputFormatter()],
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: BlocBuilder<RegisterCubit, RegisterState>(
                    buildWhen: (previous, current) => previous.isLastNameFocused != current.isLastNameFocused,
                    builder: (context, state) {
                      return SquareSvgImageFromAsset(
                        AppImage.name,
                        size: 20,
                        color: AppColor.white,
                      );
                    },
                  ),
                ),
              ),
              const SizeBoxH(16),
              CommonTextField(
                labelColor: AppColor.white,
                controller: initialState.phoneController,
                labelText: S
                    .of(context)
                    .phoneNumber,
                hintText: S
                    .of(context)
                    .enterYourPhoneNumber,
                keyboardType: TextInputType.phone,
                focus: initialState.phoneFocus,
                validator: validateMobileNumber,
                inputFormatters: [NumberInputFormatter(length: 10)],
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: BlocBuilder<RegisterCubit, RegisterState>(
                    buildWhen: (previous, current) => previous.isPhoneFocused != current.isPhoneFocused,
                    builder: (context, state) {
                      return const SquareSvgImageFromAsset(
                        AppImage.phone,
                        size: 20,
                        color : AppColor.white,
                      );
                    },
                  ),
                ),
              ),
              const SizeBoxH(16),
              CommonTextField(
                labelColor: AppColor.white,
                controller: initialState.emailController,
                labelText: S
                    .of(context)
                    .email,
                hintText: S
                    .of(context)
                    .enterEmailAddress,
                keyboardType: TextInputType.emailAddress,
                focus: initialState.emailFocus,
                validator: validateEmail,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: BlocBuilder<RegisterCubit, RegisterState>(
                    buildWhen: (previous, current) => previous.isEmailFocused != current.isEmailFocused,
                    builder: (context, state) {
                      return SquareSvgImageFromAsset(
                        AppImage.email,
                        size: 20,
                        color: AppColor.white,
                      );
                    },
                  ),
                ),
              ),
              const SizeBoxH(16),
              CommonTextField(
                labelColor: AppColor.white,
                controller: initialState.passwordController,
                labelText: S
                    .of(context)
                    .password,
                hintText: S
                    .of(context)
                    .password,
                keyboardType: TextInputType.visiblePassword,
                focus: initialState.passwordFocus,
                obscure: true,
                validator: validatePassword,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: BlocBuilder<RegisterCubit, RegisterState>(
                    buildWhen: (previous, current) => previous.isPasswordFocused != current.isPasswordFocused,
                    builder: (context, state) {
                      return const SquareSvgImageFromAsset(
                        AppImage.password,
                        size: 20,
                        color: AppColor.white,
                      );
                    },
                  ),
                ),
              ),
              const SizeBoxH(24),
              CommonButton(
                onPressed: BlocProvider
                    .of<RegisterCubit>(context)
                    .onSignUpTap,
                label: S
                    .of(context)
                    .signUp,
              ),
              const SizeBoxH(16),
              CommonButton(
                onPressed: () => Navigator.of(context).pushNamed(AppRoute.loginScreen),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text.rich(
                    TextSpan(
                      text: S.of(context).existingUsers + " ",
                      style: const TextStyle(color: AppColor.textPrimary,  fontSize: 18, fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          text: S.of(context).loginIn,
                          style: const TextStyle(color: AppColor.primary, fontSize: 18, fontWeight: FontWeight.w700 , decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushNamed(AppRoute.loginScreen);
                            },
                        ),
                        TextSpan(
                          text: S.of(context).here,
                          style: const TextStyle(color: AppColor.textPrimary, fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                bgColor: AppColor.white,
              ),
              const SizeBoxH(16),
            ],
          ),
        ),
      ),
    );
  }
}
