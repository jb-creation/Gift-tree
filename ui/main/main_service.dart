part of 'main_view.dart';

class MainService extends BaseApiService {
  MainService(BuildContext context) : super(context);

  Future<User?> getProfile() async {
    try {
      return callApi(client.getProfile(AppPref.userId), doShowLoader: false);
    } catch (error) {
      AppLogger.log("MainService.getProfile -> $error");
    }
  }

  /*Future<Dashboard?> dashboard() async {
    try {
      return callApi(client.dashboard(), doShowLoader: false);
    } catch (error) {
      AppLogger.log("MainService.dashboard -> $error");
    }
  }*/

  /*Future<void> syncContacts(List<String> listPhoneNumber, List<String> listEmail) async {
    try {
      await callApi(client.syncContacts(listPhoneNumber: listPhoneNumber, listEmail: listEmail), doShowLoader: false);
    } catch (error) {
      AppLogger.log("ContactsListService.getContacts -> $error");
    }
  }*/
}
