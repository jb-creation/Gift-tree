part of 'add_card_view.dart';

class AddCardState extends Equatable {
  final GlobalKey<FormState> formKey;

  final TextEditingController numberController;
  final TextEditingController nameController;
  final TextEditingController expiryDateController;
  final TextEditingController cvvController;
  final TextEditingController streetAddressController;
  final TextEditingController zipCodeController;

  final FocusNode numberFocus;
  final FocusNode nameFocus;
  final FocusNode zipFocus;
  final FocusNode streetAddressFocus;
  final FocusNode expiryDateFocus;
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String selectedState;
  final String selectedCity;
  final bool isNumberFocused;
  final bool isNameFocused;
  final bool isExpiryDateFocused;
  final bool isZipFocused;
  final bool isStreetFocused;

  List<String> listState;
  List<String> listCity;

  AddCardState(
      this.formKey,
      this.numberController,
      this.nameController,
      this.expiryDateController,
      this.zipCodeController,
      this.streetAddressController,
      this.cvvController,
      this.numberFocus,
      this.nameFocus,
      this.zipFocus,
      this.streetAddressFocus,
      this.expiryDateFocus,
      {this.cardNumber = "",
      this.cardHolderName = "Card Holder",
      this.expiryDate = "",
      this.selectedCity = "",
      this.selectedState = "",
      this.isNumberFocused = false,
      this.isNameFocused = false,
      this.isExpiryDateFocused = false,
      this.isZipFocused = false,
      this.isStreetFocused = false,
      this.listCity = const [],
      this.listState = const []});

  static AddCardState getCardsState(CardsData data) {
    return AddCardState(
      GlobalKey<FormState>(),
      TextEditingController(text: data.CardNumber),
      TextEditingController(text: data.CardNumber),
      TextEditingController(text: getFormattedCardMonth(data.ExpiryDate, false)),
      TextEditingController(text: data.ZIP),
      TextEditingController(text: data.StreetAddress),
      TextEditingController(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      selectedState: cityStateJson.keys.contains(data.State)
          ? data.State
          : cityStateJson.keys.first,
      selectedCity: data.City,
      listState: cityStateJson.keys.toList(),
      listCity: cityStateJson[cityStateJson.keys.contains(data.State)
              ? data.State
              : cityStateJson.keys.first]!
          .toList(),
    );
  }

  static AddCardState get initialState => AddCardState(
        GlobalKey<FormState>(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        FocusNode(),
        FocusNode(),
        FocusNode(),
        FocusNode(),
        FocusNode(),
        selectedState: cityStateJson.keys.first,
        selectedCity: cityStateJson[cityStateJson.keys.first]!.first,
        listState: cityStateJson.keys.toList(),
        listCity: cityStateJson[cityStateJson.keys.first]!.toList(),
      );

  @override
  List<Object?> get props => [
        cardNumber,
        cardHolderName,
        expiryDate,
        isNumberFocused,
        isNameFocused,
        zipFocus,
        streetAddressFocus,
        isExpiryDateFocused,
        isZipFocused,
        isStreetFocused,
        listState,
        listCity,
      ];

  AddCardState copyWith(
      {String? cardNumber,
      String? cardHolderName,
      String? expiryDate,
      bool? isNumberFocused,
      bool? isNameFocused,
      bool? isExpiryDateFocused,
      bool? isZipFocused,
      bool? isStreetFocused,
      String? selectedState,
      String? selectedCity,
      List<String>? listCity,
      List<String>? listState,
      CardsData? cardsData}) {
    return AddCardState(
      formKey,
      numberController,
      nameController,
      expiryDateController,
      zipCodeController,
      streetAddressController,
      cvvController,
      numberFocus,
      nameFocus,
      zipFocus,
      expiryDateFocus,
      streetAddressFocus,
      isNumberFocused: isNumberFocused ?? this.isNumberFocused,
      isNameFocused: isNameFocused ?? this.isNameFocused,
      isExpiryDateFocused: isExpiryDateFocused ?? this.isExpiryDateFocused,
      isStreetFocused: isStreetFocused ?? this.isStreetFocused,
      isZipFocused: isZipFocused ?? this.isZipFocused,
      cardNumber: cardNumber ?? this.cardNumber,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      expiryDate: expiryDate ?? this.expiryDate,
      selectedCity: selectedCity ?? this.selectedCity,
      selectedState: selectedState ?? this.selectedState,
      listCity: listCity ?? this.listCity,
      listState: listState ?? this.listState,
    );
  }
}
