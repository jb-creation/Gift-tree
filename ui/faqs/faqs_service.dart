part of 'faqs_view.dart';

class FAQsService extends BaseApiService {

  FAQsService(BuildContext context) : super(context);

  Future<List<FaqsData>> getFaqsList() async {
    try {
      var resp = await callApi(client.getFaqs(), doShowLoader: false);
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
