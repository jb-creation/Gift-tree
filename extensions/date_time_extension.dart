part of 'extension.dart';

extension $DateTimeExtension on DateTime {
  String toLocalString([String format = "yyyy-MM-dd HH:mm:ss"]) {
    var strDate = DateFormat(format).format(toLocal());
    return strDate;
  }

  String toUtcString([String format = "yyyy-MM-dd HH:mm:ss"]) {
    var strDate = DateFormat(format).format(toUtc());
    return strDate;
  }
}
