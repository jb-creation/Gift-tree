part of 'password_recovery_view.dart';

class PasswordRecoveryCubit extends BaseCubit<PasswordRecoveryState> {
  PasswordRecoveryCubit(BuildContext context) : super(context, PasswordRecoveryState.initialState) {
    _addListeners();
  }

  /// Adds Listeners on [FocusNode] for phone
  void _addListeners() {
    state.phoneFocus.addListener(() {
      emit(state.copyWith(isPhoneFocused: state.phoneFocus.hasFocus));
    });
  }

  /// Called on Send Code Button tap on Password recovery screen
  /// This function sends code to entered number & also handles
  /// navigation to the next screen [OtpVerificationView]
  void onSendCodeTap() {
    context.hideKeyboard();
    if (state.formKey.currentState!.validate()) {
      Navigator.of(context).pushNamed(AppRoute.otpVerificationScreen, arguments: {
        "type": "forgot_password",
        "mobile_number": state.phoneController.text,
      });
    }
  }
}
