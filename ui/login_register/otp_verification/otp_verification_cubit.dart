part of 'otp_verification_view.dart';

class OtpVerificationCubit extends BaseCubit<OtpVerificationState> {
  final Map<String, dynamic> args;

  OtpVerificationCubit(BuildContext context, this.args)
      : super(context, OtpVerificationState(TextEditingController(), args["type"], args["mobile_number"]));

  void clearError() {
    emit(state.copyWith(isValid: true, error: ""));
  }

  void onResendTap() {}

  void onAuthenticateTap() {
    context.hideKeyboard();
    if (validate()) {}
  }

  bool validate() {
    if (state.otpController.text.isEmpty) {
      emit(state.copyWith(isValid: false, error: S.current.pleaseEnterCode));
      return false;
    } else if (state.otpController.text.length < 4) {
      emit(state.copyWith(isValid: false, error: S.current.pleaseEnterValidCode));
      return false;
    } else {
      emit(state.copyWith(isValid: true, error: ""));
      return true;
    }
  }

  void onNextTap() {
    context.hideKeyboard();
    if (validate()) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoute.resetPasswordScreen, ModalRoute.withName(AppRoute.loginScreen));
    }
  }
}
