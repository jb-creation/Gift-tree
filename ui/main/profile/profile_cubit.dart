part of 'profile_view.dart';

class ProfileCubit extends BaseCubit<ProfileState> {
  ProfileCubit(BuildContext context) : super(context, ProfileState.initialState);

  void onProfileItemTap(_ProfileOption option) {
    switch(option){

      case _ProfileOption.firstName:
        // TODO: Handle this case.
        break;
      case _ProfileOption.lastName:
        // TODO: Handle this case.
        break;
      case _ProfileOption.emailAddress:
        // TODO: Handle this case.
        break;
      case _ProfileOption.mobileNumber:
        // TODO: Handle this case.
        break;
      case _ProfileOption.notifications:
        Navigator.of(context).pushNamed(AppRoute.settingsScreen);
        break;
      case _ProfileOption.changePassword:
        Navigator.of(context).pushNamed(AppRoute.changePassword);
        break;
      case _ProfileOption.termsAndConditions:
        break;
    }
  }
}
