part of 'register_view.dart';

class RegisterState extends Equatable {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController addressController;
  final TextEditingController dobController;
  final TextEditingController passwordController;
  final FocusNode nameFocus;
  final FocusNode lastNameFocus;
  final FocusNode phoneFocus;
  final FocusNode emailFocus;
  final FocusNode addressFocus;
  final FocusNode dobFocus;
  final FocusNode passwordFocus;
  final bool isNameFocused;
  final bool isLastNameFocused;
  final bool isPhoneFocused;
  final bool isEmailFocused;
  final bool isAddressFocused;
  final bool isDobFocused;
  final bool isPasswordFocused;
  final bool isTermsAccepted;

  const RegisterState(
    this.formKey,
    this.nameController,
    this.lastNameController,
    this.phoneController,
    this.emailController,
    this.addressController,
    this.dobController,
    this.passwordController,
    this.nameFocus,
    this.lastNameFocus,
    this.phoneFocus,
    this.emailFocus,
    this.addressFocus,
    this.dobFocus,
    this.passwordFocus, {
    this.isNameFocused = false,
    this.isLastNameFocused = false,
    this.isPhoneFocused = false,
    this.isEmailFocused = false,
    this.isAddressFocused = false,
    this.isDobFocused = false,
    this.isPasswordFocused = false,
    this.isTermsAccepted = true,
  });

  @override
  List<Object?> get props => [
        isNameFocused,
        isPhoneFocused,
        isEmailFocused,
        isAddressFocused,
        isDobFocused,
        isPasswordFocused,
        isTermsAccepted
      ];

  static RegisterState get initialState => RegisterState(
        GlobalKey<FormState>(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        FocusNode(),
        FocusNode(),
        FocusNode(),
        FocusNode(),
        FocusNode(),
        FocusNode(),
        FocusNode(),
      );

  RegisterState copyWith({
    bool? isNameFocused,
    bool? isLastNameFocused,
    bool? isPhoneFocused,
    bool? isEmailFocused,
    bool? isAddressFocused,
    bool? isDobFocused,
    bool? isPasswordFocused,
    bool? isTermsAccepted,
  }) {
    return RegisterState(
      formKey,
      nameController,
      lastNameController,
      phoneController,
      emailController,
      addressController,
      dobController,
      passwordController,
      nameFocus,
      lastNameFocus,
      phoneFocus,
      emailFocus,
      addressFocus,
      dobFocus,
      passwordFocus,
      isNameFocused: isNameFocused ?? this.isNameFocused,
      isLastNameFocused: isLastNameFocused ?? this.isLastNameFocused,
      isPhoneFocused: isPhoneFocused ?? this.isPhoneFocused,
      isEmailFocused: isEmailFocused ?? this.isEmailFocused,
      isAddressFocused: isAddressFocused ?? this.isAddressFocused,
      isDobFocused: isDobFocused ?? this.isDobFocused,
      isPasswordFocused: isPasswordFocused ?? this.isPasswordFocused,
      isTermsAccepted: isTermsAccepted ?? this.isTermsAccepted,
    );
  }
}
