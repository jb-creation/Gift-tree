// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bank _$BankFromJson(Map<String, dynamic> json) => Bank(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$BankToJson(Bank instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };

BankAccount _$BankAccountFromJson(Map<String, dynamic> json) => BankAccount(
      id: json['id'] as int,
      bank: Bank.fromJson(json['bank'] as Map<String, dynamic>),
      accountNumber: json['account_number'] as String,
    );

Map<String, dynamic> _$BankAccountToJson(BankAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bank': instance.bank,
      'account_number': instance.accountNumber,
    };

ChatData _$ChatDataFromJson(Map<String, dynamic> json) => ChatData(
      id: json['id'] as int,
      isOnline: json['isOnline'] as bool,
      image: json['image'] as String,
      name: json['name'] as String,
      message: json['message'] as String,
      time: json['time'] as String,
    );

Map<String, dynamic> _$ChatDataToJson(ChatData instance) => <String, dynamic>{
      'id': instance.id,
      'isOnline': instance.isOnline,
      'image': instance.image,
      'name': instance.name,
      'message': instance.message,
      'time': instance.time,
    };

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => ChatMessage(
      id: json['id'] as int,
      message: json['message'] as String,
      time: DateTime.parse(json['time'] as String),
      to: json['to'] as String,
      from: json['from'] as String,
      type: json['type'] as int,
    );

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'time': instance.time.toIso8601String(),
      'to': instance.to,
      'from': instance.from,
      'type': instance.type,
    };

FaqsData _$FaqsDataFromJson(Map<String, dynamic> json) => FaqsData(
      Question: json['Question'] as String,
      Answer: json['Answer'] as String,
    );

Map<String, dynamic> _$FaqsDataToJson(FaqsData instance) => <String, dynamic>{
      'Question': instance.Question,
      'Answer': instance.Answer,
    };

NotificationSettingsData _$NotificationSettingsDataFromJson(
        Map<String, dynamic> json) =>
    NotificationSettingsData(
      id: json['id'] as int,
      title: json['title'] as String,
      selected: json['selected'] as bool,
    );

Map<String, dynamic> _$NotificationSettingsDataToJson(
        NotificationSettingsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'selected': instance.selected,
    };

EncryptData _$EncryptDataFromJson(Map<String, dynamic> json) => EncryptData(
      mac: json['mac'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$EncryptDataToJson(EncryptData instance) =>
    <String, dynamic>{
      'mac': instance.mac,
      'value': instance.value,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      token: json['token'] as String,
      Message: json['Message'] as String,
      Name: json['Name'] as String,
      UserID: json['UserID'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'Message': instance.Message,
      'Name': instance.Name,
      'UserID': instance.UserID,
    };

RegisterRespone _$RegisterResponeFromJson(Map<String, dynamic> json) =>
    RegisterRespone(
      UniqueUserID: json['UniqueUserID'] as String,
      Output: json['Output'] as String,
      Message: json['Message'] as String?,
    );

Map<String, dynamic> _$RegisterResponeToJson(RegisterRespone instance) =>
    <String, dynamic>{
      'UniqueUserID': instance.UniqueUserID,
      'Output': instance.Output,
      'Message': instance.Message,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      UniqueUserID: json['UniqueUserID'] as String,
      FirstName: json['FirstName'] as String,
      LastName: json['LastName'] as String,
      PhoneNumber: json['PhoneNumber'] as String,
      Email: json['Email'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'UniqueUserID': instance.UniqueUserID,
      'FirstName': instance.FirstName,
      'LastName': instance.LastName,
      'PhoneNumber': instance.PhoneNumber,
      'Email': instance.Email,
    };

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      title: json['title'] as String,
      detail: json['detail'] as String,
      type: json['type'] as int,
      to: json['to'] == null
          ? null
          : TransactionUser.fromJson(json['to'] as Map<String, dynamic>),
      from: json['from'] == null
          ? null
          : TransactionUser.fromJson(json['from'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'title': instance.title,
      'detail': instance.detail,
      'type': instance.type,
      'to': instance.to,
      'from': instance.from,
    };

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      amount: (json['amount'] as num).toDouble(),
      type: json['type'] as int,
      time: DateTime.parse(json['time'] as String),
      to: json['to'] == null
          ? null
          : TransactionUser.fromJson(json['to'] as Map<String, dynamic>),
      from: json['from'] == null
          ? null
          : TransactionUser.fromJson(json['from'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'type': instance.type,
      'time': instance.time.toIso8601String(),
      'to': instance.to,
      'from': instance.from,
    };

Transaction_ _$Transaction_FromJson(Map<String, dynamic> json) => Transaction_(
      FirstName: json['FirstName'] as String,
      LastName: json['LastName'] as String,
      Amount: json['Amount'] as String,
      Received: json['Received'] as String?,
      DateEntered: json['DateEntered'] as String,
      Status: json['Status'] as String,
      Currency: json['Currency'] as String,
    );

Map<String, dynamic> _$Transaction_ToJson(Transaction_ instance) =>
    <String, dynamic>{
      'FirstName': instance.FirstName,
      'LastName': instance.LastName,
      'Amount': instance.Amount,
      'Received': instance.Received,
      'DateEntered': instance.DateEntered,
      'Status': instance.Status,
      'Currency': instance.Currency,
    };

Rates _$RatesFromJson(Map<String, dynamic> json) => Rates(
      CountryName: json['CountryName'] as String,
      CountryCode: json['CountryCode'] as String,
      Rate: json['Rate'] as int,
    );

Map<String, dynamic> _$RatesToJson(Rates instance) => <String, dynamic>{
      'CountryName': instance.CountryName,
      'CountryCode': instance.CountryCode,
      'Rate': instance.Rate,
    };

CardsData _$CardsDataFromJson(Map<String, dynamic> json) => CardsData(
      CardNumber: json['CardNumber'] as String,
      ExpiryDate: json['ExpiryDate'] as String,
      StreetAddress: json['StreetAddress'] as String,
      City: json['City'] as String,
      State: json['State'] as String,
      ZIP: json['ZIP'] as String,
      CardType: json['CardType'] as int,
    );

Map<String, dynamic> _$CardsDataToJson(CardsData instance) => <String, dynamic>{
      'CardNumber': instance.CardNumber,
      'ExpiryDate': instance.ExpiryDate,
      'StreetAddress': instance.StreetAddress,
      'City': instance.City,
      'State': instance.State,
      'ZIP': instance.ZIP,
      'CardType': instance.CardType,
    };

TransactionData _$TransactionDataFromJson(Map<String, dynamic> json) =>
    TransactionData(
      title: json['title'] as String,
      listTransaction: (json['list_transaction'] as List<dynamic>)
          .map((e) => Transaction_.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionDataToJson(TransactionData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'list_transaction': instance.listTransaction,
    };

TransactionUser _$TransactionUserFromJson(Map<String, dynamic> json) =>
    TransactionUser(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$TransactionUserToJson(TransactionUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
