part of 'register_view.dart';

class RegisterCubit extends BaseCubit<RegisterState> {
  late final RegisterService _service;

  RegisterCubit(BuildContext context) : super(context, RegisterState.initialState) {
    _service = RegisterService(context);
    _addListeners();
  }

  /// Adds Listeners on [FocusNode] for phone and password
  void _addListeners() {
    state.nameFocus.addListener(() {
      emit(state.copyWith(isNameFocused: state.nameFocus.hasFocus));
    });
    state.phoneFocus.addListener(() {
      emit(state.copyWith(isPhoneFocused: state.phoneFocus.hasFocus));
    });
    state.emailFocus.addListener(() {
      emit(state.copyWith(isEmailFocused: state.emailFocus.hasFocus));
    });
    state.addressFocus.addListener(() {
      emit(state.copyWith(isAddressFocused: state.addressFocus.hasFocus));
    });
    state.dobFocus.addListener(() {
      emit(state.copyWith(isDobFocused: state.dobFocus.hasFocus));
    });
    state.passwordFocus.addListener(() {
      emit(state.copyWith(isPasswordFocused: state.passwordFocus.hasFocus));
    });
  }

  Future<void> selectDateOfBirth() async {
    var now = DateTime.now();
    var dob = await showDatePicker(
      context: context,
      initialDate: state.dobController.text.length == 10
          ? state.dobController.text.parseLocalDateTime("dd/MM/yyyy")
          : now.subtract(const Duration(days: 365 * 20)),
      firstDate: now.subtract(const Duration(days: 365 * 100)),
      lastDate: now.subtract(const Duration(days: 365 * 12)),
    );
    dob?.let((it) {
      state.dobController.text = it.toLocalString("dd/MM/yyyy");
    });
  }

  Future<void> onSignUpTap() async {
    context.hideKeyboard();
    if (state.formKey.currentState!.validate()) {
      var loginData = await _service.register(
        firstname: state.nameController.text,
        lastname: state.lastNameController.text,
        email: state.emailController.text,
        password: state.passwordController.text,
        phonenumber: state.phoneController.text,
      );
      loginData?.let((it) async {

        var loginData = await _service.login(state.emailController.text, state.passwordController.text);

        loginData?.let((resp) async {
          AppPref.userToken = resp.token;
          AppPref.isLogin = true;
          AppPref.userId = resp.UserID;

          var user = await _service.getProfile();
          if (user != null) {
            AppPref.user = user;
          }
          Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.mainScreen, (_) => false);
        });
      });
    }
  }

  void toggleTerms(bool? value) {
    emit(state.copyWith(isTermsAccepted: value));
  }

  void onSignInTap() {
    Navigator.of(context).pop();
  }

  void openTermsAndCondition() {
    // Navigator.of(context).pop();
  }
}
