part of 'home_view.dart';

class HomeCubit extends BaseCubit<HomeState> {
  final HomeService _service;

  HomeCubit(BuildContext context)
      : _service = HomeService(context),
        super(context, HomeState.initialState) {
    getRates();
    getTransactionsList();
  }

  String rate() {
    if (state.contact != null && state.listRates.isNotEmpty) {
      var code = state.contact?.number.substring(0, 4);

      var rateC = coutryCodes[code];
      if (rateC != null) {
        var contactDetail = state.listRates
            .firstWhere((element) => element.CountryCode == rateC);
        return S
            .of(context)
            .exchange(contactDetail.Rate, contactDetail.CountryCode);
      } else {
        return S.of(context).exchange("1000", "TZS");
      }
    }

    if (state.contact == null && state.listRates.isNotEmpty) {
      var rateC = state.selected?.key;
      return S.of(context).exchange(
          state.listRates
              .firstWhere((element) => element.CountryCode == rateC)
              .Rate,
          rateC!);
    } else {
      return S.of(context).exchange("1000", "TZS");
    }
  }

  String rateReceive() {
    int receive = int.parse(
        state.sendController.text.isNotEmpty ? state.sendController.text : "0");

    if (state.contact != null && state.listRates.isNotEmpty) {
      var code = state.contact?.number.substring(0, 4);

      var rateC = coutryCodes[code];
      if (rateC != null) {
        var contactDetail = state.listRates
            .firstWhere((element) => element.CountryCode == rateC);
        return S.of(context).receiveExchange(
            contactDetail.Rate * receive, contactDetail.CountryCode);
      } else {
        return S.of(context).receiveExchange(1000 * receive, "TZS");
      }
    }

    if (state.contact == null && state.listRates.isNotEmpty) {
      var rateC = state.selected?.key;

      return S.of(context).receiveExchange(
          state.listRates
                  .firstWhere((element) => element.CountryCode == rateC)
                  .Rate *
              receive,
          rateC!);
    } else {
      return S.of(context).receiveExchange(1000 * receive, "TZS");
    }
  }

  String rateFlag() {
    if (state.contact != null && state.listRates.isNotEmpty) {
      var code = state.contact?.number.substring(0, 4);

      var rateC = coutryCodes[code];
      if (rateC != null) {
        return countryFlags[rateC] ?? AppImage.tanzaniaFlag;
      } else {
        return countryFlags["TZS"] ?? AppImage.tanzaniaFlag;
      }
    }

    if (state.contact == null && state.listRates.isNotEmpty) {
      var rateC = state.selected?.key;
      return countryFlags[rateC]!;
    } else {
      return countryFlags["TZS"] ?? AppImage.tanzaniaFlag;
    }
  }

  Future<void> onRecipientTap() async {
    var contact = await Navigator.of(context).pushNamed(
        AppRoute.contactsListScreen,
        arguments: {"type": "withdraw"});

    print("CONTACTTT $contact");
    if (contact != null && contact is Contacts) {
      var code = state.contact?.number.substring(0, 4);
      var rateC = coutryCodes[code];
      emit(state.copyWith(contact: contact,selected: countryFlags.entries
          .firstWhere((element) => element.key == rateC)));
    }
  }

  void onSendChange(String value) {
    var code = state.contact?.number.substring(0, 4);
    var rateC = coutryCodes[code];

    emit(state.copyWith(
        amount: DateTime.now().millisecond.toDouble(), contact: state.contact));
  }

  Future<void> onSendTap() async {
    var code = state.contact?.number.substring(0, 4);

    var rateC = coutryCodes[code];

    await _service.sendMoney(state.sendController.text, rateC, AppPref.userId,
        state.contact?.number, state.contact?.RecipientID);
    emit(state.copyWith(contact: null, ));
    state.sendController.clear();
    getTransactionsList();
  }

  Future<void> getRates() async {
    List<Rates> rates = await _service.getRates();
    emit(state.copyWith(listRates: rates, contact: state.contact));
  }

  Future<void> getTransactionsList() async {
    // lastId ??= state.listTransaction.isEmpty ? 0 : state.listTransaction.last.id;
    List<Transaction_> list = await _service.getTransactionList();

    emit(state.copyWith(
        amount: 23123,
        listTransaction: list.reversed.toList(),
        contact: state.contact));
  }

  void onFlagChange(String label) {
    emit(state.copyWith(
        amount: DateTime.now().millisecond.toDouble(),
        contact: null,
        selected: countryFlags.entries
            .firstWhere((element) => element.key == label)));
  }
}
