import 'package:pessa_flow/generated/l10n.dart';
import 'package:intl/intl.dart';

import 'common.dart';

String? validateMobileNumber(String? value) {
  if (value == null) {
    return null;
  } else if (value.isEmpty) {
    return S.current.pleaseEnterMobileNumber;
  } else {
    return null;
  }
}

String? validatePassword(String? value) {
  if (value == null) {
    return null;
  } else if (value.isEmpty) {
    return S.current.pleaseEnterPassword;
  } else if (value.length < 8) {
    return S.current.passwordLengthError;
  } else {
    return null;
  }
}

String? validateConfirmPassword(String? value, String password) {
  if (value == null) {
    return null;
  } else if (value.isEmpty) {
    return S.current.pleaseEnterConfirmPassword;
  } else if (value.length < 8) {
    return S.current.passwordLengthError;
  } else if (value != password) {
    return S.current.passwordMatchError;
  } else {
    return null;
  }
}

String? validateEmail(String? value) {
  if (value == null) {
    return null;
  } else if (value.isEmpty) {
    return S.current.pleaseEnterEmail;
  } else if (!RegExp(kEmailPattern).hasMatch(value)) {
    return S.current.pleaseEnterValidEmail;
  } else {
    return null;
  }
}

String? validateCardMonth(String? value) {
  if (value == null) {
    return null;
  } else if (value.isEmpty) {
    return S.current.pleaseEnterCardMonth;
  } else {
    var month = DateFormat("MM/y").parse(getFormattedCardMonth(value));
    if (month.isBefore(DateTime.now()) ||
        month.isAfter(DateTime.now().add(const Duration(days: 365 * 50)))) {
      return S.current.pleaseEnterValidCardMonth;
    } else {
      return null;
    }
  }
}

String? validateCardNumber(String? value) {
  if (value == null) {
    return null;
  } else if (value.isEmpty) {
    return S.current.pleaseEnterCardNumber;
  } else {
    var number = value.replaceAll(" ", "");
    if (number.length < 16 || number.length > 20) {
      return S.current.pleaseEnterValidCardNumber;
    } else {
      return null;
    }
  }
}

String? validateCvv(String? value) {
  if (value == null) {
    return null;
  } else if (value.isEmpty) {
    return S.current.enterCvv;
  } else if (value.length < 3 || value.length > 4) {
    return S.current.pleaseEnterValidCardMonth;
  } else {
    return null;
  }
}

String? validateCardHolderName(String? value) {
  if (value == null) {
    return null;
  } else if (value.isEmpty) {
    return S.current.pleaseEnterCardHolderName;
  } else {
    return null;
  }
}
