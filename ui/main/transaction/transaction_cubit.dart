part of 'transaction_view.dart';

class TransactionCubit extends BaseCubit<TransactionState> {
  final TransactionService _service;

  TransactionCubit(BuildContext context)
      : _service = TransactionService(context),
        super(context, const TransactionState()) {
    /* Timer.run(() {
      emit(TransactionState(
        listTransaction: [
          TransactionData(title: "Today",date: "8 Feb, 2022" , listTransaction: [
            Transaction(
              amount: 52.9,
              type: 1,
              time: DateTime.now(),
              to: TransactionUser(
                id: 1,
                name: "Glenda",
                image:
                    "https://www.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg",
              ),
            ),
            Transaction(
              amount: 70.0,
              type: 2,
              time: DateTime.now(),
              from: TransactionUser(
                id: 1,
                name: "Ronald",
                image:
                    "https://www.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg",
              ),
            ),
            Transaction(amount: 100.0, type: 3, time: DateTime.now()),
          ]),
          TransactionData(title: "Yesterday",date: "7 Feb, 2022" , listTransaction: [
            Transaction(
              amount: 52.9,
              type: 1,
              time: DateTime.now(),
              to: TransactionUser(
                id: 1,
                name: "Glenda",
                image:
                    "https://www.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg",
              ),
            ),
            Transaction(
              amount: 70.0,
              type: 2,
              time: DateTime.now(),
              from: TransactionUser(
                id: 1,
                name: "Ronald",
                image:
                    "https://www.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg",
              ),
            ),
            Transaction(amount: 100.0, type: 3, time: DateTime.now()),
          ])
        ],
      ));
    });*/
    getTransactionsList();
  }

  Future<void> getTransactionsList([int? lastId]) async {
    // lastId ??= state.listTransaction.isEmpty ? 0 : state.listTransaction.last.id;
    emit(state.copyWith(isLoading: true));
    List<Transaction_> list = await _service.getTransactionList();
    // var listTransaction = List<TransactionData>.from(state.listTransaction)..addAll(list);
    Map<String, List<Transaction_>> listTransaction = list.reversed
        .toList()
        .groupBy((Transaction_ e) => DateTime.parse(
                e.DateEntered.replaceAll(" AM", "").replaceAll(" PM", ""))
            .toLocalString("dd MMM y"));

    emit(state.copyWith(
      listTransaction: listTransaction.entries
          .toList()
          .map((e) => TransactionData(title: e.key, listTransaction: e.value))
          .toList(),
      listTransaction_ : list.reversed.toList(),
      isLoading: false,
      reachAtEnd: list.length < 20,
    ));
  }

  Future<void> onRefresh() async {
    if (!state.isLoading) {
      emit(state.copyWith(listTransaction: []));
      return getTransactionsList(0);
    }
  }

  Future<void> onLoadMore() async {
    if (!state.isLoading && !state.reachAtEnd) {
      return getTransactionsList();
    }
  }
}
