part of 'model.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Notification {
  String title;
  String detail;
  int type;

  TransactionUser? to;
  TransactionUser? from;

  Notification({
    required this.title,
    required this.detail,
    required this.type,
    this.to,
    this.from,
  });
}
