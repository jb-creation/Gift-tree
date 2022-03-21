part of 'home_view.dart';

class HomeState extends Equatable {
  final double amount;
  final List<Transaction_> listTransaction;
  final List<Rates> listRates;
  final TextEditingController recipientController;
  final TextEditingController sendController;
  final TextEditingController receiveController;
  final FocusNode recipientFocus;
  final FocusNode sendFocus;
  final FocusNode receiveFocus;
  final GlobalKey<FormState> formKey;
  final bool isRecipientFocused;
  final bool isSendFocused;
  final bool isReceiveFocused;
  MapEntry<String, String>? selected = countryFlags.entries.first;
  Contacts? contact;

  HomeState(this.recipientController, this.recipientFocus, this.sendController,
      this.sendFocus, this.receiveController, this.receiveFocus, this.formKey,
      {this.amount = 0,
      this.listTransaction = const [],
      this.listRates = const [],
      this.isRecipientFocused = false,
      this.isSendFocused = false,
      this.isReceiveFocused = false,
      this.contact,
      this.selected});

  static HomeState get initialState => HomeState(
      TextEditingController(),
      FocusNode(),
      TextEditingController(),
      FocusNode(),
      TextEditingController(),
      FocusNode(),
      GlobalKey<FormState>(),
      selected: countryFlags.entries.first);

  @override
  List<Object?> get props =>
      [amount, listTransaction, contact, listRates, selected];

  HomeState copyWith(
      {double? amount,
      List<Transaction_>? listTransaction,
      List<Rates>? listRates,
      Contacts? contact,
      MapEntry<String, String>? selected}) {
    return HomeState(recipientController, recipientFocus, sendController,
        sendFocus, receiveController, receiveFocus, formKey,
        amount: amount ?? this.amount,
        listTransaction: listTransaction ?? this.listTransaction,
        listRates: listRates ?? this.listRates,
        isRecipientFocused: isRecipientFocused,
        contact: contact,
        selected: selected ?? this.selected);
  }
}
