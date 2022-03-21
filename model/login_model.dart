part of 'model.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class LoginResponse {
  String token;
  String Message;
  String Name;
  String UserID;

  LoginResponse({
    required this.token,
    required this.Message,
    required this.Name,
    required this.UserID,
  });

  factory LoginResponse.fromJson(dynamic json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.none)
class RegisterRespone {
  String UniqueUserID;
  String Output;
  String? Message;

  RegisterRespone({
    required this.UniqueUserID,
    required this.Output,
    this.Message,
  });

  factory RegisterRespone.fromJson(dynamic json) => _$RegisterResponeFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponeToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.none)
class User {
  String UniqueUserID;
  String FirstName;
  String LastName;
  String PhoneNumber;
  String Email;

  User({
    required this.UniqueUserID,
    required this.FirstName,
    required this.LastName,
    required this.PhoneNumber,
    required this.Email,
  });

  factory User.fromJson(dynamic json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
