part of 'model.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Bank {
  int id;
  String name;
  String image;

  Bank({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);

  JsonMap toJson() => _$BankToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BankAccount {
  int id;
  Bank bank;
  String accountNumber;

  BankAccount({
    required this.id,
    required this.bank,
    required this.accountNumber,
  });

  factory BankAccount.fromJson(Map<String, dynamic> json) => _$BankAccountFromJson(json);

  JsonMap toJson() => _$BankAccountToJson(this);
}
