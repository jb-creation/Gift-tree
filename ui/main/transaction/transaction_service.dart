part of 'transaction_view.dart';

class TransactionService extends BaseApiService {
  TransactionService(BuildContext context) : super(context);

  Future<List<Transaction_>> getTransactionList() async {
    try {
      var resp = await callApi(client.getTransactions(userId: AppPref.userId), doShowLoader: false);
      return resp ?? [];
    } catch (error) {
      AppLogger.log("TransactionService.getTransactionList -> $error");
    }
    return [];
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
