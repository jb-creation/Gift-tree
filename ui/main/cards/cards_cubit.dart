part of 'cards_view.dart';

class CardsCubit extends BaseCubit<CardsState> {
  final CardService _service;

  CardsCubit(BuildContext context)
      : _service = CardService(context),
        super(context, const CardsState()) {
    getCardsList();
  }

  Future<void> getCardsList() async {
    // lastId ??= state.listTransaction.isEmpty ? 0 : state.listTransaction.last.id;
    List<CardsData> list = await _service.getCards();
    emit(state.copyWith(
      listTransaction: list,
      isLoading: false,
      reachAtEnd: list.length < 20,
    ));
  }

  Future<void> onRefresh() async {
    if (!state.isLoading) {
      emit(state.copyWith(listTransaction: []));
      return getCardsList();
    }
  }

  Future<void> onAddCardTap() async {
    var result = await Navigator.of(context)
        .pushNamed(AppRoute.addCardScreen, arguments: {"card": null});
    getCardsList();
  }

  Future<void> onEditTap(int pos) async {
    var result = await Navigator.of(context).pushNamed(AppRoute.addCardScreen,
        arguments: {"card": state.listTransaction[pos]});
    getCardsList();
  }

  String getCardImage(int cardType) {
    switch (cardType) {
      case 0:
        return AppImage.visa;
      case 1:
      case 4:
        return AppImage.visa;
      case 2:
      case 5:
        return AppImage.master;
      case 3:
        return AppImage.axp;
      case 6:
        return AppImage.dfs;
      default:
        return AppImage.visa;
    }
  }
}
