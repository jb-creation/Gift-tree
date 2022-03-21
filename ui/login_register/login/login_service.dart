part of 'login_view.dart';

class LoginService extends BaseApiService {
  LoginService(BuildContext context) : super(context);

  Future<LoginResponse?> login(String mobileNumber, String password) async {
    return callApi(
      client.login(
        userName: mobileNumber,
        password: password,
      ),
    );
  }
  Future<User?> getProfile() async {
    try {
      return callApi(client.getProfile(AppPref.userId), doShowLoader: false);
    } catch (error) {
      AppLogger.log("MainService.getProfile -> $error");
    }
  }

}
