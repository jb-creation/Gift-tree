import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

part 'app_extension.dart';

part 'data_type.dart';

part 'date_time_extension.dart';

part 'string_extension.dart';

extension $BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  EdgeInsets get mediaQueryPadding => MediaQuery.of(this).padding;

  double get height => mediaQuery.size.height;

  double get width => mediaQuery.size.width;

  double get topPadding => mediaQuery.padding.top;

  double get bottomPadding => mediaQuery.padding.bottom;

  double get topInset => mediaQuery.viewInsets.top;

  double get bottomInset => mediaQuery.viewInsets.bottom;

  Object? get args => ModalRoute.of(this)?.settings.arguments;

  TextDirection get textDirection => Directionality.of(this);

  hideKeyboard() {
    final currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
