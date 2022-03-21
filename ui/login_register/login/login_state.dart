part of 'login_view.dart';

class LoginState extends Equatable {
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final FocusNode phoneFocus;
  final FocusNode passwordFocus;
  final GlobalKey<FormState> formKey;
  final bool isPhoneFocused;
  final bool isPasswordFocused;

  const LoginState(
    this.phoneController,
    this.passwordController,
    this.phoneFocus,
    this.passwordFocus,
    this.formKey, {
    this.isPhoneFocused = false,
    this.isPasswordFocused = false,
  });

  @override
  List<Object?> get props => [isPhoneFocused, isPasswordFocused];

  static LoginState get initialState => LoginState (
    TextEditingController(),
    TextEditingController(),
    FocusNode(),
    FocusNode(),
    GlobalKey<FormState>(),
  );

  LoginState copyWith({
    bool? isPhoneFocused,
    bool? isPasswordFocused,
  }) {
    return LoginState(
      phoneController,
      passwordController,
      phoneFocus,
      passwordFocus,
      formKey,
      isPasswordFocused: isPasswordFocused ?? this.isPasswordFocused,
      isPhoneFocused: isPhoneFocused ?? this.isPhoneFocused,
    );
  }
}
