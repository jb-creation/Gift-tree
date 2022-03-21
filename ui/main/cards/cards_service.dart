part of 'cards_view.dart';

class CardService extends BaseApiService {
  CardService(BuildContext context) : super(context);

  Future<List<CardsData>> getCards() async {
    try {
      var resp = await callApi(client.getCards(uguid: AppPref.userId),
          doShowLoader: false);
      return resp ?? [];
    } catch (error) {
      AppLogger.log("TransactionService.getTransactionList -> $error");
    }
    return [];
  }
}
