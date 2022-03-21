part of 'reset_password_view.dart';

class ResetPasswordState extends Equatable {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final FocusNode passwordFocus;
  final FocusNode confirmPasswordFocus;
  final GlobalKey<FormState> formKey;
  final bool isPasswordFocused;
  final bool isConfirmPasswordFocused;

  const ResetPasswordState(
    this.passwordController,
    this.confirmPasswordController,
    this.passwordFocus,
    this.confirmPasswordFocus,
    this.formKey, {
    this.isPasswordFocused = false,
    this.isConfirmPasswordFocused = false,
  });

  @override
  List<Object?> get props => [isPasswordFocused, isConfirmPasswordFocused];

  static ResetPasswordState get initialState => ResetPasswordState(
        TextEditingController(),
        TextEditingController(),
        FocusNode(),
        FocusNode(),
        GlobalKey<FormState>(),
      );

  ResetPasswordState copyWith({
    bool? isPasswordFocused,
    bool? isConfirmPasswordFocused,
  }) {
    return ResetPasswordState(
      passwordController,
      confirmPasswordController,
      passwordFocus,
      confirmPasswordFocus,
      formKey,
      isPasswordFocused: isPasswordFocused ?? this.isPasswordFocused,
      isConfirmPasswordFocused: isConfirmPasswordFocused ?? this.isConfirmPasswordFocused,
    );
  }
}
