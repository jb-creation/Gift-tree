part of 'cards_view.dart';

class CardsState extends Equatable {
  final List<CardsData> listTransaction;
  final bool isLoading;
  final bool reachAtEnd;

  const CardsState({this.listTransaction = const [], this.reachAtEnd = false,
    this.isLoading = true,});

  @override
  List<Object?> get props => [listTransaction , isLoading,reachAtEnd];

  CardsState copyWith({List<CardsData>? listTransaction, bool? isLoading,
    bool? reachAtEnd,}) {
    return CardsState(
      listTransaction: listTransaction ?? this.listTransaction,
      isLoading: isLoading ?? this.isLoading,
      reachAtEnd: reachAtEnd ?? this.reachAtEnd,
    );
  }
}
