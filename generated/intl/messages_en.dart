// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(amount, code) =>
      "Exchange Rate: 1 USD = ${amount} ${code} with no fees";

  static String m1(permissionName) =>
      "You have permanently denied for ${permissionName} permission. To enable ${permissionName} permission, you need to go to settings and allow us to access ${permissionName}.";

  static String m2(amount, code) => "${amount} ${code}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "_locale": MessageLookupByLibrary.simpleMessage("en"),
        "accountTerms": MessageLookupByLibrary.simpleMessage(
            "By creating an account, you agree to our \nTerms of Service and Privacy Policy"),
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "addCard": MessageLookupByLibrary.simpleMessage("Add Card"),
        "addNewCard": MessageLookupByLibrary.simpleMessage("Add New Card"),
        "address": MessageLookupByLibrary.simpleMessage("Address"),
        "allContacts": MessageLookupByLibrary.simpleMessage("All Contacts"),
        "alreadyHaveAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "appName": MessageLookupByLibrary.simpleMessage("Pessa Flow"),
        "authenticate": MessageLookupByLibrary.simpleMessage("Authenticate"),
        "camera": MessageLookupByLibrary.simpleMessage("Camera"),
        "cameraPermissionDesc": MessageLookupByLibrary.simpleMessage(
            "We will access camera to take and upload image for user profile & verification document."),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cardAddedSuccessDesc": MessageLookupByLibrary.simpleMessage(
            "Now you can freely transfer and withdraw money, Enjoy it!"),
        "cardAddedSuccessfully":
            MessageLookupByLibrary.simpleMessage("Card Added Successfully"),
        "cardDetails": MessageLookupByLibrary.simpleMessage("Card Details"),
        "cardHolderName":
            MessageLookupByLibrary.simpleMessage("Card Holder Name"),
        "cardNumber": MessageLookupByLibrary.simpleMessage("Card Number"),
        "cards": MessageLookupByLibrary.simpleMessage("Cards"),
        "changePass": MessageLookupByLibrary.simpleMessage("Change Password"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "contactPermissionDesc": MessageLookupByLibrary.simpleMessage(
            "We will access your contacts to find your friends & family on our platform. We do not store your contacts on our server."),
        "contacts": MessageLookupByLibrary.simpleMessage("Contacts"),
        "continue_": MessageLookupByLibrary.simpleMessage("Continue"),
        "createNewAccount":
            MessageLookupByLibrary.simpleMessage("Create New Account"),
        "currentPass": MessageLookupByLibrary.simpleMessage("Current Password"),
        "cvv": MessageLookupByLibrary.simpleMessage("CVV"),
        "dateOfBirth": MessageLookupByLibrary.simpleMessage("Date of Birth"),
        "didntReceivedCode":
            MessageLookupByLibrary.simpleMessage("I didn\'t received code."),
        "dontHaveAccount":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account yet?"),
        "email": MessageLookupByLibrary.simpleMessage("Email Address"),
        "enterAddress": MessageLookupByLibrary.simpleMessage("Enter Address"),
        "enterAmount": MessageLookupByLibrary.simpleMessage("Enter Amount"),
        "enterCardHolderName":
            MessageLookupByLibrary.simpleMessage("Enter Card Holder Name"),
        "enterCardNumber":
            MessageLookupByLibrary.simpleMessage("Enter Card Number"),
        "enterConfirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm New Password"),
        "enterCurrentPass":
            MessageLookupByLibrary.simpleMessage("Enter Current Password"),
        "enterCvv": MessageLookupByLibrary.simpleMessage("Enter CVV"),
        "enterDate": MessageLookupByLibrary.simpleMessage("Enter Date"),
        "enterEmailAddress":
            MessageLookupByLibrary.simpleMessage("Enter Email Address"),
        "enterNewPass":
            MessageLookupByLibrary.simpleMessage("Enter New Password"),
        "enterStreetAddress":
            MessageLookupByLibrary.simpleMessage("Enter Street Address"),
        "enterYourLastName":
            MessageLookupByLibrary.simpleMessage("Enter Your Last Name"),
        "enterYourName":
            MessageLookupByLibrary.simpleMessage("Enter Your First Name"),
        "enterYourPhoneNumber":
            MessageLookupByLibrary.simpleMessage("Enter your phone number"),
        "enterZipCode": MessageLookupByLibrary.simpleMessage("Enter Zip Code"),
        "exchange": m0,
        "existingUsers":
            MessageLookupByLibrary.simpleMessage("Existing user? "),
        "expirationDate":
            MessageLookupByLibrary.simpleMessage("Expiration Date"),
        "faqs": MessageLookupByLibrary.simpleMessage("FAQ\'s"),
        "fees": MessageLookupByLibrary.simpleMessage("Fees"),
        "firstName": MessageLookupByLibrary.simpleMessage("First Name"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "getStarted": MessageLookupByLibrary.simpleMessage("Get Started"),
        "giftMadeEasy":
            MessageLookupByLibrary.simpleMessage("Gifting Made Easy"),
        "goToHome": MessageLookupByLibrary.simpleMessage("Go to Home"),
        "goToSettings": MessageLookupByLibrary.simpleMessage("Go To Settings"),
        "hello": MessageLookupByLibrary.simpleMessage("Hello"),
        "here": MessageLookupByLibrary.simpleMessage(" Here"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "information": MessageLookupByLibrary.simpleMessage("Information"),
        "joinNow": MessageLookupByLibrary.simpleMessage("Join Now"),
        "lastName": MessageLookupByLibrary.simpleMessage("Last Name"),
        "loginIn": MessageLookupByLibrary.simpleMessage("Log In"),
        "loginSubTitle": MessageLookupByLibrary.simpleMessage("Access Account"),
        "loginTitle": MessageLookupByLibrary.simpleMessage("Login"),
        "mobileNumber": MessageLookupByLibrary.simpleMessage("Mobile Number"),
        "myProfile": MessageLookupByLibrary.simpleMessage("My Profile"),
        "newPass": MessageLookupByLibrary.simpleMessage("New Password"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "noInternet": MessageLookupByLibrary.simpleMessage("No Internet"),
        "noInternetDesc": MessageLookupByLibrary.simpleMessage(
            "Please check your network connection and try again."),
        "notNow": MessageLookupByLibrary.simpleMessage("Not now"),
        "notification": MessageLookupByLibrary.simpleMessage("Notification"),
        "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
        "okay": MessageLookupByLibrary.simpleMessage("Okay"),
        "oops": MessageLookupByLibrary.simpleMessage("Oops"),
        "or": MessageLookupByLibrary.simpleMessage("or"),
        "otpAuthentication":
            MessageLookupByLibrary.simpleMessage("OTP Authentication"),
        "otpAuthenticationSubTitle": MessageLookupByLibrary.simpleMessage(
            "An authentication code been sent to"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordLengthError": MessageLookupByLibrary.simpleMessage(
            "Password must contain 8 characters!"),
        "passwordMatchError": MessageLookupByLibrary.simpleMessage(
            "Both passwords should be matched!"),
        "passwordRecoverySubTitle": MessageLookupByLibrary.simpleMessage(
            "Enter your Phone number to recover your password"),
        "passwordRecoveryTitle":
            MessageLookupByLibrary.simpleMessage("Password Recovery"),
        "permissionDenied":
            MessageLookupByLibrary.simpleMessage("Permission Denied!"),
        "permissionDeniedDesc": m1,
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
        "photos": MessageLookupByLibrary.simpleMessage("Photos"),
        "photosPermissionDesc": MessageLookupByLibrary.simpleMessage(
            "We will access photos to select and upload image for user profile & verification document."),
        "pleaseEnterAddress":
            MessageLookupByLibrary.simpleMessage("Please enter address!"),
        "pleaseEnterCVV":
            MessageLookupByLibrary.simpleMessage("Please enter CVV!"),
        "pleaseEnterCardHolderName": MessageLookupByLibrary.simpleMessage(
            "Please enter card holder name!"),
        "pleaseEnterCardMonth":
            MessageLookupByLibrary.simpleMessage("Please enter card month!"),
        "pleaseEnterCardNumber":
            MessageLookupByLibrary.simpleMessage("Please enter card number!"),
        "pleaseEnterCode":
            MessageLookupByLibrary.simpleMessage("Please enter code!"),
        "pleaseEnterConfirmPassword": MessageLookupByLibrary.simpleMessage(
            "Please enter confirm password!"),
        "pleaseEnterDateOfBirth":
            MessageLookupByLibrary.simpleMessage("Please enter date of birth!"),
        "pleaseEnterEmail":
            MessageLookupByLibrary.simpleMessage("Please enter email address!"),
        "pleaseEnterMobileNumber":
            MessageLookupByLibrary.simpleMessage("Please enter mobile number!"),
        "pleaseEnterPassword":
            MessageLookupByLibrary.simpleMessage("Please enter password!"),
        "pleaseEnterValidCVV":
            MessageLookupByLibrary.simpleMessage("Please enter valid CVV!"),
        "pleaseEnterValidCardMonth": MessageLookupByLibrary.simpleMessage(
            "Please enter valid card month!"),
        "pleaseEnterValidCardNumber": MessageLookupByLibrary.simpleMessage(
            "Please enter valid card number!"),
        "pleaseEnterValidCode":
            MessageLookupByLibrary.simpleMessage("Please enter valid code!"),
        "pleaseEnterValidEmail": MessageLookupByLibrary.simpleMessage(
            "Please enter valid email address!"),
        "pleaseEnterValidMobileNumber": MessageLookupByLibrary.simpleMessage(
            "Please enter valid mobile number!"),
        "pleaseEnterYourName":
            MessageLookupByLibrary.simpleMessage("Please enter your name!"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "receivableAmount":
            MessageLookupByLibrary.simpleMessage("Receivable Amount"),
        "receive": MessageLookupByLibrary.simpleMessage("Receive"),
        "receiveExchange": m2,
        "recentTransactions":
            MessageLookupByLibrary.simpleMessage("Last Transactions"),
        "recipientName": MessageLookupByLibrary.simpleMessage("Recipient Name"),
        "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
        "registerHere": MessageLookupByLibrary.simpleMessage("Register Here"),
        "registerRecipient":
            MessageLookupByLibrary.simpleMessage("Add Recipient"),
        "registerSubTitle": MessageLookupByLibrary.simpleMessage(
            "Create an account to continue"),
        "registerTitle":
            MessageLookupByLibrary.simpleMessage("Getting Started"),
        "resendCode": MessageLookupByLibrary.simpleMessage("Resend Code"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
        "resetPasswordSubTitle": MessageLookupByLibrary.simpleMessage(
            "At least 8 characters with upparcase and lower letters"),
        "resetPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Reset your password"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "searchContactHint":
            MessageLookupByLibrary.simpleMessage("Enter Recipient Name"),
        "searchHere": MessageLookupByLibrary.simpleMessage("Search Here ..."),
        "seeAll": MessageLookupByLibrary.simpleMessage("See All"),
        "select": MessageLookupByLibrary.simpleMessage("Select"),
        "selectPhoto": MessageLookupByLibrary.simpleMessage("Select Photo"),
        "send": MessageLookupByLibrary.simpleMessage("Send"),
        "sendCode": MessageLookupByLibrary.simpleMessage("Send Code"),
        "sendMoney": MessageLookupByLibrary.simpleMessage("Send Money"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "signInInstruction":
            MessageLookupByLibrary.simpleMessage("By Signin, you agree to our"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
        "signUpInstruction": MessageLookupByLibrary.simpleMessage(
            "By creating an account, you are agree to our"),
        "skip": MessageLookupByLibrary.simpleMessage("Skip"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Something Went Wrong"),
        "storage": MessageLookupByLibrary.simpleMessage("Storage"),
        "storagePermissionDesc": MessageLookupByLibrary.simpleMessage(
            "We will access storage to select and upload image for user profile & verification document."),
        "streetAddress": MessageLookupByLibrary.simpleMessage("Street Address"),
        "takePhoto": MessageLookupByLibrary.simpleMessage("Take Photo"),
        "termsAndCondition":
            MessageLookupByLibrary.simpleMessage("Terms & Condition"),
        "transaction": MessageLookupByLibrary.simpleMessage("Transaction"),
        "transactions": MessageLookupByLibrary.simpleMessage("Transactions"),
        "transactionsHistory":
            MessageLookupByLibrary.simpleMessage("Transaction History"),
        "updateCard":
            MessageLookupByLibrary.simpleMessage("Update Card Detail"),
        "updateProfile": MessageLookupByLibrary.simpleMessage("Update Profile"),
        "verifyIdentitySubTitle":
            MessageLookupByLibrary.simpleMessage("We have just send code to"),
        "verifyIdentityTitle":
            MessageLookupByLibrary.simpleMessage("Verify your identity"),
        "welcomeText": MessageLookupByLibrary.simpleMessage(
            "The easiest way to transaction and save your money"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes"),
        "zipCode": MessageLookupByLibrary.simpleMessage("Zip Code")
      };
}
