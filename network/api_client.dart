import 'dart:async';
import 'dart:io';

import 'package:pessa_flow/constants/size.dart';
import 'package:pessa_flow/model/model.dart';
import 'package:pessa_flow/network/api_endpoints.dart';
import 'package:pessa_flow/network/interceptors/api_interceptor.dart';
import 'package:pessa_flow/network/interceptors/cache_interceptor.dart';
import 'package:pessa_flow/network/interceptors/refresh_token_interceptor.dart';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  static late ApiClient _instance;
  static late Dio dio;
  static const bool doWriteLog = true;
  static const bool doEncryption = false;

  static ApiClient get instance => _instance;

  factory ApiClient._private(Dio dio, {String baseUrl}) = _ApiClient;

  /* @POST(ApiEndpoints.phoneRegister)
  Future<OtpData> registerMobile(@Field("country_code") String countryCode, @Field("phone_no") String phoneNumber);

  @POST(ApiEndpoints.forgetPassword)
  Future<OtpData> forgetPassword(@Field("country_code") String countryCode, @Field("phone_no") String phoneNumber);
*/
  @POST(ApiEndpoints.resetPassword)
  Future<bool> resetPassword({
    @Field("token") required String token,
    @Field("password") required String password,
    @Field("password_confirmation") required String passwordConfirmation,
  });

  @POST(ApiEndpoints.verifyOtp)
  Future<bool> verifyOtp(@Field("otp") String otp, @Field("token") String token,
      @Field("token_type") String tokenType);

  @GET(ApiEndpoints.getFaqs)
  Future<List<FaqsData>> getFaqs();

  @POST(ApiEndpoints.getCards)
  Future<List<CardsData>> getCards({
    @Field("UGuid") String? uguid,
  });

  @POST(ApiEndpoints.register)
  Future<RegisterRespone> register({
    @Field("FirstName") required String firstname,
    @Field("LastName") required String lastname,
    @Field("PhoneNumber") required String phonenumber,
    @Field("Email") required String email,
    @Field("Password") required String password,
  });

  @POST(ApiEndpoints.sendMoney)
  Future<dynamic> sendMoney({
    @Field("Amount") required String amount,
    @Field("Country") required String? country,
    @Field("UniqueUserID") required String userId,
    @Field("PhoneNumber") required String? phoneNumber,
    @Field("RecipientID") required String? recipientId,
  });

  @POST(ApiEndpoints.login)
  Future<LoginResponse> login({
    @Field("Username") required String userName,
    @Field("Password") required String password,
  });

  @POST(ApiEndpoints.addPayment)
  Future<dynamic> addPayment({
    @Field("UGuid") String? uguid,
    @Field("CreditCardNumber") String? creditCardNumber,
    @Field("ExpiryDate") String? expiryDate,
    @Field("SecurityCode") String? securityCode,
    @Field("StreetAddress") String? streetAddress,
    @Field("City") String? city,
    @Field("State") String? state,
    @Field("ZIP") String? zIP,
  });

  @POST(ApiEndpoints.updatePayment)
  Future<dynamic> updatePayment({
    @Field("UGuid") String? uguid,
    @Field("CreditCardNumber") String? creditCardNumber,
    @Field("ExpiryDate") String? expiryDate,
    @Field("SecurityCode") String? securityCode,
    @Field("StreetAddress") String? streetAddress,
    @Field("City") String? city,
    @Field("State") String? state,
    @Field("ZIP") String? zIP,
  });

  @POST(ApiEndpoints.profile)
  Future<User> getProfile(@Field("UGuid") String userId);

  @POST(ApiEndpoints.updateProfile)
  Future<dynamic> updateProfile({
    @Field("UniqueUserID") String? userId,
    @Field("FirstName") String? fName,
    @Field("LastName") String? lName,
    @Field("Email") String? email,
    @Field("PhoneNumber") String? phone,
  });

  @POST(ApiEndpoints.registerRecipient)
  Future<dynamic> registerRecipient({
    @Field("UserID") String? userId,
    @Field("FirstName") String? fName,
    @Field("LastName") String? lName,
    @Field("PhoneNumber") String? phone,
  });

  @POST(ApiEndpoints.checkVerifiedCustomer)
  Future<dynamic> checkVerifiedCustomer({
    @Field("UserID") required String userId,
    @Field("PhoneNumber") required String number,
  });

  @POST(ApiEndpoints.changePassword)
  Future<bool> changePassword({
    @Field("password") required String password,
    @Field("password_confirmation") required String passwordConfirmation,
  });

  @POST(ApiEndpoints.transactionsList)
  Future<List<Transaction_>> getTransactions({
    @Field("UGuid") required String userId,
  });

  @GET(ApiEndpoints.getRates)
  Future<List<Rates>> getRates();

  /*@MultiPart()
  @POST(ApiEndpoints.uploadImage)
  Future<ImageData> uploadImage({
    @Part(name: "avatar") required File avatar,
    @Part(name: "type") required int type,
  });

  @POST(ApiEndpoints.logout)
  Future<bool> logout(@Field("device_token") String token);

  @GET(ApiEndpoints.privacyPolicy)
  Future<dynamic> privacyPolicy();

  @GET(ApiEndpoints.termsAndCondition)
  Future<dynamic> termsAndCondition();

  @GET(ApiEndpoints.settings)
  Future<CommonSettings> getCommonSettings();

  @GET(ApiEndpoints.getContacts)
  Future<List<Contacts>> getContacts();

  @POST(ApiEndpoints.syncContacts)
  Future<dynamic> syncContacts({
    @Field("phone_no") required List<String> listPhoneNumber,
    @Field("email") required List<String> listEmail,
  });

  @POST(ApiEndpoints.transfer)
  Future<bool> transfer({
    @Field("to") required int to,
    @Field("from") required int from,
    @Field("amount") required double amount,
  });

  @POST(ApiEndpoints.request)
  Future<bool> request({
    @Field("to") required int to,
    @Field("from") required int from,
    @Field("amount") required double amount,
  });

  @POST(ApiEndpoints.requestAccept)
  Future<bool> requestAccept({
    @Field("request_id") required int requestId,
    @Field("message_id") required int messageId,
  });

  @GET(ApiEndpoints.verifyUser)
  Future<OtpData> verifyUser({@Query("type") required String type});

  @POST(ApiEndpoints.setPaymentPassword)
  Future<bool> setPaymentCode(@Field("password") String password);

  @POST(ApiEndpoints.updatePaymentPassword)
  Future<bool> updatePaymentCode(
    @Field("old_password") String oldPassword,
    @Field("new_password") String newPassword,
  );

  @POST(ApiEndpoints.checkPaymentPassword)
  Future<bool> checkPaymentCode(@Field("password") String password);

  @GET(ApiEndpoints.forgotPaymentPassword)
  Future<OtpData> forgotPaymentPassword();

  @GET(ApiEndpoints.chatMessages)
  Future<List<ChatMessage>> getChatMessages({
    @Query("chat_id") required String chatId,
    @Query("offset") required int offset,
    @Query("limit") int limit = kChatPageSize,
  });



  @GET(ApiEndpoints.transactionDetails)
  Future<TransactionDetail> getTransactionDetail(@Query("id") int id);

  @GET(ApiEndpoints.dashboard)
  Future<Dashboard> dashboard();

  @POST(ApiEndpoints.kyc)
  Future<bool> updateKyc({
    @Field("kyc_front") required String frontImage,
    @Field("kyc_back") String? backImage,
  });

  @POST(ApiEndpoints.addCard)
  Future<UserCard> addCard({@Field("token") required String token});

  @GET(ApiEndpoints.getCards)
  Future<List<UserCard>> getCards();

  @DELETE(ApiEndpoints.deleteCard)
  Future<bool> deleteCard({@Query("id") required String id});

  @DELETE(ApiEndpoints.deleteBank)
  Future<bool> deleteBank({@Query("id") required int id});

  @POST(ApiEndpoints.addBank)
  Future<UserBank> addBank({
    @Field("account_holder_type") required String accountHolderType,
    @Field("account_holder_name") required String accountHolderName,
    @Field("currency") required String currency,
    @Field("routing_number") required String routingNumber,
    @Field("account_number") required String accountNumber,
  });

  @GET(ApiEndpoints.getBank)
  Future<List<UserBank>> getBanks();

  @GET(ApiEndpoints.getCharges)
  Future<TransactionCharges> getCharges(@Query("amount") double amount);

  @GET(ApiEndpoints.notifications)
  Future<List<Notification>> getNotifications(@Query("last_id") int lastId, {@Query("limit") int limit = kPageSize});

  @GET(ApiEndpoints.readNotifications)
  Future<void> readNotifications();

  @POST(ApiEndpoints.setDefault)
  Future<bool> setDefault(@Field("id") String id, @Field("type") int type);

  @GET(ApiEndpoints.getDefault)
  Future<UserDefaults> getDefault();

  @GET(ApiEndpoints.getAllBank)
  Future<List<Bank>> getAllBanks();

  @POST(ApiEndpoints.initPayment)
  Future<PaymentIntentConfig> initStripePayment(@Field("amount") double amount, @Field("currency") String currency);

  @GET(ApiEndpoints.connectAccount)
  Future<dynamic> connectAccount();

  @POST(ApiEndpoints.payout)
  Future<bool> patOut({
    @Field("amount") required double amount,
    @Field("currency") required String currency,
    @Field("bank_id") required int bankId,
  });

  @GET(ApiEndpoints.supportType)
  Future<List<CommonType>> getSupportType();

  @POST(ApiEndpoints.addSupportRequest)
  Future<RequestTicket> addSupportRequest({
    @Field("feedback_type_id") required int type,
    @Field("message") required String message,
    @Field("contact_information") required String contactInfo,
    @Field("images") required List<String> images,
  });

  @GET(ApiEndpoints.requestTickets)
  Future<List<RequestTicket>> getRequestTickets({
    @Query("last_id") required int lastId,
    @Query("search") required String search,
  });

  @GET(ApiEndpoints.supportMessages)
  Future<List<SupportMessage>> getSupportMessages({
    @Query("feedback_id") required int id,
    @Query("offset") required int offset,
    @Query("limit") int limit = kChatPageSize,
  });*/

  static Future<void> init() async {
    var options = BaseOptions(
      baseUrl: ApiEndpoints.baseApi,
      connectTimeout: 30000,
      receiveTimeout: 60000,
      sendTimeout: 60000,
      headers: {
        "Content-Type": "application/json",
        "Accept": 'application/json'
      },
    );
    dio = Dio(options);
    dio.interceptors.addAll([
      ApiInterceptor(doEncryption: doEncryption, doWriteLog: doWriteLog),
      CacheInterceptor(),
    ]);
    _instance = ApiClient._private(dio, baseUrl: ApiEndpoints.baseApi);
  }
}
