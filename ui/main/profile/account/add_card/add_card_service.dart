part of 'add_card_view.dart';

class AddCardService extends BaseApiService {
  AddCardService(BuildContext context) : super(context);

  Future<dynamic> addCard(
    String cardNumber,
    String expDate,
    String cvv,
    String address,
    String city,
    String state,
    String zip,
  ) async {
    return callApi(
      client.addPayment(
          uguid: AppPref.userId,
          creditCardNumber: cardNumber,
          expiryDate: expDate,
          securityCode: cvv,
          streetAddress: address,
          city: city,
          state: state,
          zIP: zip),
    );
  }


  Future<dynamic> updateCard(
    String cardNumber,
    String expDate,
    String cvv,
    String address,
    String city,
    String state,
    String zip,
  ) async {
    return callApi(
      client.updatePayment(
          uguid: AppPref.userId,
          creditCardNumber: cardNumber,
          expiryDate: expDate,
          securityCode: cvv,
          streetAddress: address,
          city: city,
          state: state,
          zIP: zip),
    );
  }
}
