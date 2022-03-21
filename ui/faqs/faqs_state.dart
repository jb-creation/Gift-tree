part of 'faqs_view.dart';

class FaqsState extends Equatable {
  final List<FaqsData> listFaqs;

  const FaqsState({this.listFaqs = const []});

  @override
  List<Object?> get props => [listFaqs];

  FaqsState copyWith({List<FaqsData>? listFaqs}) {
    return FaqsState(
      listFaqs: listFaqs ?? this.listFaqs,
    );
  }
}
