part of 'register_view.dart';

class RegisterService extends BaseApiService {
  RegisterService(BuildContext context) : super(context);

  Future<RegisterRespone?> register({
    required String email,
    required String firstname,
    required String lastname,
    required String phonenumber,
    required String password,
    String? referralCode,
    int? authType,
    String? socialId,
  }) async {
    return callApi(
      client.register(
        firstname: firstname,
        lastname: lastname,
        phonenumber: phonenumber,
        email: email,
        password: password,
      ),
    );
  }

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
