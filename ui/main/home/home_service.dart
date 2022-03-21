part of 'home_view.dart';

class HomeService extends BaseApiService {
  HomeService(BuildContext context) : super(context);

  Future<List<Transaction_>> getTransactionList() async {
    try {
      var resp = await callApi(client.getTransactions(userId: AppPref.userId),
          doShowLoader: false);
      return resp ?? [];
    } catch (error) {
      AppLogger.log("HomeService.getTransactionList -> $error");
    }
    return [];
  }

  Future<List<Rates>> getRates() async {
    try {
      var resp = await callApi(client.getRates(), doShowLoader: false);
      return resp ?? [];
    } catch (error) {
      AppLogger.log("HomeService.getRates -> $error");
    }
    return [];
  }

  Future<dynamic> sendMoney(String text, String? rateC, String userId,
      String? substring, String? recipientID) async {
    try {
      var resp = await callApi(
          client.sendMoney(
              amount: text,
              country: rateC,
              userId: userId,
              phoneNumber: substring,
              recipientId: recipientID),
          doShowLoader: true);
      return resp;
    } catch (error) {
      AppLogger.log("HomeService.getRates -> $error");
    }
    return {};
  }

/* Future<TransactionDetail?> getTransactionDetail(int id) async {
    // try {
    var resp = await callApi(client.getTransactionDetail(id), doShowLoader: false);
    return resp;
    // } catch (error) {
    //   AppLogger.log("TransactionService.getTransactionDetail -> $error");
    // }
  }*/
}
