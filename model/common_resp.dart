part of 'model.dart';

@JsonSerializable()
class EncryptData {
  String mac;
  String value;

  EncryptData({required this.mac, required this.value});

  factory EncryptData.fromJson(dynamic json) => _$EncryptDataFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptDataToJson(this);
}
