class ApiEndpoints {
  ApiEndpoints._();

  static const _portNumber = 4001;

  // region -------------------------------- Local Server --------------------------------
  // static const baseUrlIp = "192.168.0.49";
  // static const baseUrl = "http://$baseUrlIp:$_portNumber";
  // endregion

  // region -------------------------------- Live Server --------------------------------
  static const baseUrlIp = "";
  static const baseUrl = "https://smartcash.azurewebsites.net";

  // endregion

  static const baseUrlSocket = "http://$baseUrlIp:$_portNumber";
  static const baseApi = "$baseUrl/api/";

  // region -------------------------------- Authentication --------------------------------
  static const login = "Authenticate";
  static const register = "UserSignUp";
  static const sendMoney = "SendToPaymentQueue";
  static const getFaqs = "GetFAQ";
  static const addPayment = "AddPayment";
  static const updatePayment = "UpdatePaymentInfo";
  static const updateProfile = "UpdateUserInfo";
  static const transactionsList = "GetTransactionHistory";
  static const getRates = "GetCurrentRates";
  static const getCards = "GetPaymentInformation";

  static const logout = "logout";
  static const socialCheck = "social-check";
  static const verifyOtp = "verify-otp";
  static const phoneRegister = "phone-register";
  static const refreshToken = "${baseApi}refresh-auth-token";
  static const forgetPassword = "forget-password";
  static const resetPassword = "reset-password";

  // endregion

  // region -------------------------------- User --------------------------------
  static const profile = "GetUserInformation";
  static const checkVerifiedCustomer = "CheckVerifiedCustomer";
  static const registerRecipient = "AddVerifiedCustomer";
  static const kyc = "kyc";
  static const changePassword = "change-password";
  static const verifyUser = "verify-user";
  static const setPaymentPassword = "set-payment-password";
  static const updatePaymentPassword = "update-payment-password";
  static const forgotPaymentPassword = "forgot-payment-password";
  static const checkPaymentPassword = "check-payment-password";

  // endregion

  // region -------------------------------- Transaction --------------------------------
  static const transfer = "transfer";
  static const request = "request";
  static const requestAccept = "request-accept";

  static const transactionDetails = "transaction-details";
  static const addCard = "add-card";

  static const deleteCard = "delete-card";
  static const deleteBank = "delete-bank";
  static const addBank = "add-bank";
  static const getBank = "get-banks";
  static const setDefault = "make-default";
  static const getDefault = "get-default";
  static const getCharges = "charges-breakdown";
  static const getAllBank = "get-bank";
  static const initPayment = "payment-init";
  static const connectAccount = "connect-account";
  static const payout = "payout";

  // endregion

  // region -------------------------------- Common --------------------------------
  static const uploadImage = "image-upload";
  static const privacyPolicy = "privacy_policy";
  static const termsAndCondition = "terms-and-condition";
  static const getContacts = "get-contacts";
  static const syncContacts = "sync-contacts";
  static const settings = "settings";
  static const dashboard = "dashboard";
  static const notifications = "notifications";
  static const readNotifications = "read-notifications";

  // endregion

  // region -------------------------------- Chat --------------------------------
  static const chatMessages = "chat-messages";

// endregion

  // region -------------------------------- Support --------------------------------
  static const supportType = "get-feedbacktype";
  static const addSupportRequest = "store-feedback";
  static const requestTickets = "get-feedback";
  static const supportMessages = "support-messages";

// endregion
}
