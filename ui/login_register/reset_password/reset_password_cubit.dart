part of 'reset_password_view.dart';

class ResetPasswordCubit extends BaseCubit<ResetPasswordState> {
  ResetPasswordCubit(BuildContext context) : super(context, ResetPasswordState.initialState) {
    _addListeners();
  }

  /// Adds Listeners on [FocusNode] for phone and password
  void _addListeners() {
    state.passwordFocus.addListener(() {
      emit(state.copyWith(isPasswordFocused: state.passwordFocus.hasFocus));
    });
    state.confirmPasswordFocus.addListener(() {
      emit(state.copyWith(isConfirmPasswordFocused: state.confirmPasswordFocus.hasFocus));
    });
  }

  void onResetPasswordTap() {
    context.hideKeyboard();
    if (state.formKey.currentState!.validate()) {
      Navigator.of(context).pop();
    }
  }
}
