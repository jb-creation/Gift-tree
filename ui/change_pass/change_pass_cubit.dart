part of 'change_pass_view.dart';

class ChangePassCubit extends BaseCubit<ChangePassState> {
  ChangePassCubit(BuildContext context) : super(context, ChangePassState.initialState);

  void onSubmitTap() {
    if(state.formKey.currentState!.validate()){
      Navigator.of(context).pop();
    }
  }
}
