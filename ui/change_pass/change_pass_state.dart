part of 'change_pass_view.dart';

class ChangePassState extends Equatable {
  final TextEditingController currentController;
  final TextEditingController newController;
  final TextEditingController confirmController;
  final FocusNode currentFocus;
  final FocusNode newFocus;
  final FocusNode confirmFocus;
  final GlobalKey<FormState> formKey;

  const ChangePassState(
      this.currentController,
      this.currentFocus,
      this.newController,
      this.newFocus,
      this.confirmController,
      this.confirmFocus,
      this.formKey);

  static ChangePassState get initialState => ChangePassState(
      TextEditingController(),
      FocusNode(),
      TextEditingController(),
      FocusNode(),
      TextEditingController(),
      FocusNode(),
      GlobalKey<FormState>());

  @override
  List<Object?> get props => [];

  ChangePassState copyWith() {
    return ChangePassState(
      currentController,
      currentFocus,
      newController,
      newFocus,
      confirmController,
      confirmFocus,
      formKey,
    );
  }
}
