part of 'model.dart';

class Contacts {
  int id;
  String name;
  Uint8List image;
  String number;
  String? RecipientID;

  Contacts({
    required this.id,
    required this.name,
    required this.image,
    required this.number,
    this.RecipientID
  });
}
