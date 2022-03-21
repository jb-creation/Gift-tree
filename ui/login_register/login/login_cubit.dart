part of 'login_view.dart';

class LoginCubit extends BaseCubit<LoginState> {
  late final LoginService _service;

  LoginCubit(BuildContext context) : super(context, LoginState.initialState) {
    _service = LoginService(context);
    _addListeners();
  }

  /// Adds Listeners on [FocusNode] for phone and password
  void _addListeners() {
    state.phoneFocus.addListener(() {
      emit(state.copyWith(isPhoneFocused: state.phoneFocus.hasFocus));
    });
    state.passwordFocus.addListener(() {
      emit(state.copyWith(isPasswordFocused: state.passwordFocus.hasFocus));
    });
  }

  /// Calls on tap of forgot tab
  /// handles navigation to [PasswordRecoveryView]
  void onForgotTap() {
    Navigator.of(context).pushNamed(AppRoute.passwordRecoveryScreen);
  }

  /// Calls on tap of Google Tap
  /// handles google login
  void onGoogleTap() {}

  /// Calls on tap of Facebook Tap
  /// handles facebook login
  void onFacebookTap() {}

  /// Calls on tap of Sign In Button Tap
  /// handles sign in with phone number and password
  Future<void> onSignInTap() async {
    context.hideKeyboard();
    if (state.formKey.currentState!.validate()) {
      var loginData = await _service.login(state.phoneController.text, state.passwordController.text);

      loginData?.let(_handleLoginSuccess);
    }
  }

  Future<void> _handleLoginSuccess(LoginResponse resp) async {
    AppPref.userToken = resp.token;
    AppPref.isLogin = true;
    AppPref.userId = resp.UserID;

    var user = await _service.getProfile();
    if (user != null) {
      AppPref.user = user;
    }
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.mainScreen, (_) => false);
  }

  /// Calls on tap of Register Tap
  /// handles navigation to [RegisterView]
  void onRegisterTap() {
    Navigator.of(context).pushNamed(AppRoute.registerScreen);
  }
}
