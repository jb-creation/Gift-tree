part of 'faqs_view.dart';

class FaqsCubit extends BaseCubit<FaqsState> {
  final FAQsService _service;

  FaqsCubit(BuildContext context)
      : _service = FAQsService(context),
        super(context, const FaqsState()) {
    getFaqsList();
  }

  Future<void> getFaqsList([int? lastId]) async {
    // lastId ??= state.listTransaction.isEmpty ? 0 : state.listTransaction.last.id;
    List<FaqsData> list = await _service.getFaqsList();
    // var listTransaction = List<TransactionData>.from(state.listTransaction)..addAll(list);
    emit(state.copyWith(listFaqs: list));
  }
}
