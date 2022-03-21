part of 'model.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Transaction {
  double amount;
  int type;
  DateTime time;
  TransactionUser? to;
  TransactionUser? from;

  Transaction(
      {required this.amount,
      required this.type,
      required this.time,
      this.to,
      this.from});

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  JsonMap toJson() => _$TransactionToJson(this);
}

@JsonSerializable()
class Transaction_ {
  String FirstName;
  String LastName;
  String Amount;
  String? Received;
  String DateEntered;
  String Status;
  String Currency;

  Transaction_({
    required this.FirstName,
    required this.LastName,
    required this.Amount,
    required this.Received,
    required this.DateEntered,
    required this.Status,
    required this.Currency,
  });

  factory Transaction_.fromJson(Map<String, dynamic> json) =>
      _$Transaction_FromJson(json);

  JsonMap toJson() => _$Transaction_ToJson(this);
}

@JsonSerializable()
class Rates {
  String CountryName;
  String CountryCode;
  int Rate;


  Rates({
    required this.CountryName,
    required this.CountryCode,
    required this.Rate,

  });

  factory Rates.fromJson(Map<String, dynamic> json) =>
      _$RatesFromJson(json);

  JsonMap toJson() => _$RatesToJson(this);
}

@JsonSerializable()
class CardsData {

  String CardNumber;
  String ExpiryDate;
  String StreetAddress;
  String City;
  String State;
  String ZIP;
  int CardType;

  CardsData({
    required this.CardNumber,
    required this.ExpiryDate,
    required this.StreetAddress,
    required this.City,
    required this.State,
    required this.ZIP,
    required this.CardType,
  });

  factory CardsData.fromJson(Map<String, dynamic> json) =>
      _$CardsDataFromJson(json);

  JsonMap toJson() => _$CardsDataToJson(this);
}



@JsonSerializable(fieldRename: FieldRename.snake)
class TransactionData {
  String title;
  List<Transaction_> listTransaction;

  TransactionData({required this.title, required this.listTransaction});

  factory TransactionData.fromJson(Map<String, dynamic> json) =>
      _$TransactionDataFromJson(json);

  JsonMap toJson() => _$TransactionDataToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class TransactionUser {
  int id;
  String name;
  String image;

  TransactionUser({
    required this.id,
    required this.name,
    required this.image,
  });

  factory TransactionUser.fromJson(Map<String, dynamic> json) =>
      _$TransactionUserFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionUserToJson(this);
}
