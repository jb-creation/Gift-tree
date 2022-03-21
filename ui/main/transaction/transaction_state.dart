part of 'transaction_view.dart';

class TransactionState extends Equatable {
  final List<TransactionData> listTransaction;
  final List<Transaction_> listTransaction_;

  final bool isLoading;
  final bool reachAtEnd;

  const TransactionState({
    this.listTransaction = const [],
    this.listTransaction_ = const [],
    this.reachAtEnd = false,
    this.isLoading = true,
  });

  @override
  List<Object?> get props => [listTransaction, reachAtEnd, isLoading,listTransaction_];

  TransactionState copyWith({
    List<TransactionData>? listTransaction,
    List<Transaction_>? listTransaction_,
    bool? isLoading,
    bool? reachAtEnd,
  }) {
    return TransactionState(
      listTransaction: listTransaction ?? this.listTransaction,
      listTransaction_: listTransaction_ ?? this.listTransaction_,
      isLoading: isLoading ?? this.isLoading,
      reachAtEnd: reachAtEnd ?? this.reachAtEnd,
    );
  }
}
