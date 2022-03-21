import 'package:pessa_flow/constants/route.dart';
import 'package:pessa_flow/extensions/extension.dart';
import 'package:pessa_flow/generated/l10n.dart';
import 'package:pessa_flow/res/colors.dart';
import 'package:pessa_flow/ui/common_views/registration_header_view.dart';
import 'package:pessa_flow/utils/base_cubit.dart';
import 'package:pessa_flow/widgets/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

part 'otp_verification_cubit.dart';

part 'otp_verification_state.dart';

class OtpVerificationView extends StatefulWidget {
  const OtpVerificationView({Key? key}) : super(key: key);

  @override
  _OtpVerificationViewState createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  @override
  Widget build(BuildContext context) {
    var initialState = BlocProvider.of<OtpVerificationCubit>(context).state;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              if (initialState.type == "forgot_password")
                RegistrationHeaderView(
                  title: S.of(context).verifyIdentityTitle,
                  subTitle: S.of(context).verifyIdentitySubTitle + " \n" + initialState.mobileNumber,
                )
              else
                RegistrationHeaderView(
                  title: S.of(context).otpAuthentication,
                  subTitle: S.of(context).otpAuthenticationSubTitle + " \n" + initialState.mobileNumber,
                ),
              BlocBuilder<OtpVerificationCubit, OtpVerificationState>(
                buildWhen: (previous, current) => previous.isValid != current.isValid,
                builder: (context, state) {
                  return PinCodeTextField(
                    keyboardType: TextInputType.number,
                    controller: state.otpController,
                    hasError: !state.isValid,
                    pinBoxRadius: 12,
                    defaultBorderColor: AppColor.greyLight,
                    hideCharacter: true,
                    maxLength: 4,
                    errorBorderColor: AppColor.red,
                    pinBoxColor: AppColor.white,
                    highlightColor: AppColor.primary,
                    hasTextBorderColor: AppColor.primary,
                    pinBoxBorderWidth: 1,
                    onTextChanged: (_) => BlocProvider.of<OtpVerificationCubit>(context).clearError(),
                  );
                },
              ),
              BlocBuilder<OtpVerificationCubit, OtpVerificationState>(
                buildWhen: (previous, current) => previous.isValid != current.isValid,
                builder: (context, state) {
                  return state.isValid
                      ? const SizeBoxH(24)
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: CommonText.medium(
                            state.error,
                            size: 14,
                            color: AppColor.red,
                            textAlign: TextAlign.center,
                          ),
                        );
                },
              ),
              Text.rich(
                TextSpan(
                  text: S.of(context).didntReceivedCode + " ",
                  style: const TextStyle(color: AppColor.textPrimary, fontSize: 14, fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: S.of(context).resendCode,
                      style: const TextStyle(color: AppColor.primary, fontSize: 14, fontWeight: FontWeight.w500),
                      recognizer: TapGestureRecognizer()
                        ..onTap = BlocProvider.of<OtpVerificationCubit>(context).onResendTap,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, 8, 24, 16 + context.bottomInset),
          child: initialState.type == "forgot_password"
              ? IntrinsicHeight(
                  child: CommonButton(
                    onPressed: BlocProvider.of<OtpVerificationCubit>(context).onNextTap,
                    label: S.of(context).next,
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: S.of(context).signInInstruction + "\n",
                        style: const TextStyle(
                          color: AppColor.textPrimaryLight,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(
                            text: S.of(context).termsAndCondition,
                            style: const TextStyle(color: AppColor.textPrimary),
                            recognizer: TapGestureRecognizer()
                              ..onTap = BlocProvider.of<OtpVerificationCubit>(context).onResendTap,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizeBoxH(16),
                    CommonButton(
                      onPressed: BlocProvider.of<OtpVerificationCubit>(context).onAuthenticateTap,
                      label: S.of(context).authenticate,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
