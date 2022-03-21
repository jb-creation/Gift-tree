// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<bool> resetPassword(
      {required token,
      required password,
      required passwordConfirmation}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'token': token,
      'password': password,
      'password_confirmation': passwordConfirmation
    };
    final _result = await _dio.fetch<bool>(_setStreamType<bool>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'reset-password',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<bool> verifyOtp(otp, token, tokenType) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'otp': otp, 'token': token, 'token_type': tokenType};
    final _result = await _dio.fetch<bool>(_setStreamType<bool>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'verify-otp',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<List<FaqsData>> getFaqs() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<FaqsData>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'GetFAQ',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => FaqsData.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<CardsData>> getCards({uguid}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {'UGuid': uguid};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<CardsData>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'GetPaymentInformation',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => CardsData.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<RegisterRespone> register(
      {required firstname,
      required lastname,
      required phonenumber,
      required email,
      required password}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'FirstName': firstname,
      'LastName': lastname,
      'PhoneNumber': phonenumber,
      'Email': email,
      'Password': password
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RegisterRespone>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'UserSignUp',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RegisterRespone.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> sendMoney(
      {required amount,
      country,
      required userId,
      phoneNumber,
      recipientId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {
      'Amount': amount,
      'Country': country,
      'UniqueUserID': userId,
      'PhoneNumber': phoneNumber,
      'RecipientID': recipientId
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'SendToPaymentQueue',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<LoginResponse> login({required userName, required password}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'Username': userName, 'Password': password};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'Authenticate',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> addPayment(
      {uguid,
      creditCardNumber,
      expiryDate,
      securityCode,
      streetAddress,
      city,
      state,
      zIP}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {
      'UGuid': uguid,
      'CreditCardNumber': creditCardNumber,
      'ExpiryDate': expiryDate,
      'SecurityCode': securityCode,
      'StreetAddress': streetAddress,
      'City': city,
      'State': state,
      'ZIP': zIP
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'AddPayment',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> updatePayment(
      {uguid,
      creditCardNumber,
      expiryDate,
      securityCode,
      streetAddress,
      city,
      state,
      zIP}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {
      'UGuid': uguid,
      'CreditCardNumber': creditCardNumber,
      'ExpiryDate': expiryDate,
      'SecurityCode': securityCode,
      'StreetAddress': streetAddress,
      'City': city,
      'State': state,
      'ZIP': zIP
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'UpdatePaymentInfo',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<User> getProfile(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'UGuid': userId};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'GetUserInformation',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = User.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> updateProfile({userId, fName, lName, email, phone}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {
      'UniqueUserID': userId,
      'FirstName': fName,
      'LastName': lName,
      'Email': email,
      'PhoneNumber': phone
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'UpdateUserInfo',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> registerRecipient({userId, fName, lName, phone}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {
      'UserID': userId,
      'FirstName': fName,
      'LastName': lName,
      'PhoneNumber': phone
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'AddVerifiedCustomer',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> checkVerifiedCustomer(
      {required userId, required number}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'UserID': userId, 'PhoneNumber': number};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'CheckVerifiedCustomer',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<bool> changePassword(
      {required password, required passwordConfirmation}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'password': password,
      'password_confirmation': passwordConfirmation
    };
    final _result = await _dio.fetch<bool>(_setStreamType<bool>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'change-password',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<List<Transaction_>> getTransactions({required userId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'UGuid': userId};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Transaction_>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'GetTransactionHistory',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Transaction_.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<Rates>> getRates() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<Rates>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, 'GetCurrentRates',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Rates.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
