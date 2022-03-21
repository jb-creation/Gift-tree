part of 'password_recovery_view.dart';

class PasswordRecoveryState extends Equatable {
  final TextEditingController phoneController;
  final FocusNode phoneFocus;
  final GlobalKey<FormState> formKey;
  final bool isPhoneFocused;

  const PasswordRecoveryState(
    this.phoneController,
    this.phoneFocus,
    this.formKey, {
    this.isPhoneFocused = false,
  });

  @override
  List<Object?> get props => [isPhoneFocused];

  static PasswordRecoveryState get initialState => PasswordRecoveryState(
        TextEditingController(),
        FocusNode(),
        GlobalKey<FormState>(),
      );

  PasswordRecoveryState copyWith({bool? isPhoneFocused}) {
    return PasswordRecoveryState(
      phoneController,
      phoneFocus,
      formKey,
      isPhoneFocused: isPhoneFocused ?? this.isPhoneFocused,
    );
  }
}
