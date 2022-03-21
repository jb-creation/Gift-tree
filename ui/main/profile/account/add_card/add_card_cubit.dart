part of 'add_card_view.dart';

class AddCardCubit extends BaseCubit<AddCardState> {
  final AddCardService _service;
  Map<String, dynamic> args;

  AddCardCubit(BuildContext context, this.args)
      : _service = AddCardService(context),
        super(
            context,
            (args["card"] != null)
                ? AddCardState.getCardsState(args["card"])
                : AddCardState.initialState) {
    _addListeners();
  }

  get title => (args["card"] == null)
      ? S.of(context).addNewCard
      : S.of(context).updateCard;

  /// Adds Listeners on [FocusNode] for phone and password
  void _addListeners() {
    state.nameFocus.addListener(() {
      emit(state.copyWith(isNameFocused: state.nameFocus.hasFocus));
    });
    state.numberFocus.addListener(() {
      emit(state.copyWith(isNumberFocused: state.numberFocus.hasFocus));
    });
    state.expiryDateFocus.addListener(() {
      emit(state.copyWith(isExpiryDateFocused: state.expiryDateFocus.hasFocus));
    });

    state.zipFocus.addListener(() {
      emit(state.copyWith(isZipFocused: state.zipFocus.hasFocus));
    });
    state.streetAddressFocus.addListener(() {
      emit(state.copyWith(isStreetFocused: state.streetAddressFocus.hasFocus));
    });

    state.numberController.addListener(() {
      emit(state.copyWith(cardNumber: state.numberController.text));
    });
    state.expiryDateController.addListener(() {
      emit(state.copyWith(expiryDate: state.expiryDateController.text));
    });
    state.nameController.addListener(() {
      emit(state.copyWith(
        cardHolderName: state.nameController.text.isEmpty
            ? "Card Holder"
            : state.nameController.text,
      ));
    });
  }

  void onAddCardTap() async {
    context.hideKeyboard();
    if (state.formKey.currentState!.validate()) {
      if (args["card"] == null) {
        var user = await _service.addCard(
            state.numberController.text,
            state.expiryDateController.text.replaceAll("/", ""),
            state.cvvController.text,
            state.streetAddressController.text,
            state.selectedCity,
            state.selectedState,
            state.zipCodeController.text);
      } else {
        await _service.updateCard(
            state.numberController.text,
            state.expiryDateController.text.replaceAll("/", ""),
            state.cvvController.text,
            state.streetAddressController.text,
            state.selectedCity,
            state.selectedState,
            state.zipCodeController.text);
      }

      Navigator.of(context).pop();
    }
  }

  void onChangeState(String stateName) {
    emit(state.copyWith(
        selectedState: stateName,
        listCity: cityStateJson[stateName],
        selectedCity: cityStateJson[stateName]?.first));
  }

  void onChangeCity(String selectedCity) {
    emit(state.copyWith(
      selectedCity: selectedCity,
    ));
  }
}
