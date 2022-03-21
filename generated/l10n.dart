// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `en`
  String get _locale {
    return Intl.message(
      'en',
      name: '_locale',
      desc: '',
      args: [],
    );
  }

  /// `Pessa Flow`
  String get appName {
    return Intl.message(
      'Pessa Flow',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Gifting Made Easy`
  String get giftMadeEasy {
    return Intl.message(
      'Gifting Made Easy',
      name: 'giftMadeEasy',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account`
  String get createNewAccount {
    return Intl.message(
      'Create New Account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Existing user? `
  String get existingUsers {
    return Intl.message(
      'Existing user? ',
      name: 'existingUsers',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get loginIn {
    return Intl.message(
      'Log In',
      name: 'loginIn',
      desc: '',
      args: [],
    );
  }

  /// ` Here`
  String get here {
    return Intl.message(
      ' Here',
      name: 'here',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you agree to our \nTerms of Service and Privacy Policy`
  String get accountTerms {
    return Intl.message(
      'By creating an account, you agree to our \nTerms of Service and Privacy Policy',
      name: 'accountTerms',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginTitle {
    return Intl.message(
      'Login',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Access Account`
  String get loginSubTitle {
    return Intl.message(
      'Access Account',
      name: 'loginSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enterYourPhoneNumber {
    return Intl.message(
      'Enter your phone number',
      name: 'enterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account yet?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account yet?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register Here`
  String get registerHere {
    return Intl.message(
      'Register Here',
      name: 'registerHere',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Join Now`
  String get joinNow {
    return Intl.message(
      'Join Now',
      name: 'joinNow',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email {
    return Intl.message(
      'Email Address',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter Email Address`
  String get enterEmailAddress {
    return Intl.message(
      'Enter Email Address',
      name: 'enterEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message(
      'See All',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Send Money`
  String get sendMoney {
    return Intl.message(
      'Send Money',
      name: 'sendMoney',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your First Name`
  String get enterYourName {
    return Intl.message(
      'Enter Your First Name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Last Name`
  String get enterYourLastName {
    return Intl.message(
      'Enter Your Last Name',
      name: 'enterYourLastName',
      desc: '',
      args: [],
    );
  }

  /// `Recipient Name`
  String get recipientName {
    return Intl.message(
      'Recipient Name',
      name: 'recipientName',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Receive`
  String get receive {
    return Intl.message(
      'Receive',
      name: 'receive',
      desc: '',
      args: [],
    );
  }

  /// `Exchange Rate: 1 USD = {amount} {code} with no fees`
  String exchange(Object amount, Object code) {
    return Intl.message(
      'Exchange Rate: 1 USD = $amount $code with no fees',
      name: 'exchange',
      desc: '',
      args: [amount, code],
    );
  }

  /// `{amount} {code}`
  String receiveExchange(Object amount, Object code) {
    return Intl.message(
      '$amount $code',
      name: 'receiveExchange',
      desc: '',
      args: [amount, code],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Transaction`
  String get transaction {
    return Intl.message(
      'Transaction',
      name: 'transaction',
      desc: '',
      args: [],
    );
  }

  /// `Cards`
  String get cards {
    return Intl.message(
      'Cards',
      name: 'cards',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Enter Address`
  String get enterAddress {
    return Intl.message(
      'Enter Address',
      name: 'enterAddress',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Oops`
  String get oops {
    return Intl.message(
      'Oops',
      name: 'oops',
      desc: '',
      args: [],
    );
  }

  /// `Okay`
  String get okay {
    return Intl.message(
      'Okay',
      name: 'okay',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `FAQ's`
  String get faqs {
    return Intl.message(
      'FAQ\'s',
      name: 'faqs',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobileNumber {
    return Intl.message(
      'Mobile Number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Street Address`
  String get streetAddress {
    return Intl.message(
      'Street Address',
      name: 'streetAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter Street Address`
  String get enterStreetAddress {
    return Intl.message(
      'Enter Street Address',
      name: 'enterStreetAddress',
      desc: '',
      args: [],
    );
  }

  /// `Zip Code`
  String get zipCode {
    return Intl.message(
      'Zip Code',
      name: 'zipCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter Zip Code`
  String get enterZipCode {
    return Intl.message(
      'Enter Zip Code',
      name: 'enterZipCode',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePass {
    return Intl.message(
      'Change Password',
      name: 'changePass',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPass {
    return Intl.message(
      'New Password',
      name: 'newPass',
      desc: '',
      args: [],
    );
  }

  /// `Enter New Password`
  String get enterNewPass {
    return Intl.message(
      'Enter New Password',
      name: 'enterNewPass',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get enterConfirmPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'enterConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPass {
    return Intl.message(
      'Current Password',
      name: 'currentPass',
      desc: '',
      args: [],
    );
  }

  /// `Enter Current Password`
  String get enterCurrentPass {
    return Intl.message(
      'Enter Current Password',
      name: 'enterCurrentPass',
      desc: '',
      args: [],
    );
  }

  /// `Enter Recipient Name`
  String get searchContactHint {
    return Intl.message(
      'Enter Recipient Name',
      name: 'searchContactHint',
      desc: '',
      args: [],
    );
  }

  /// `Transaction History`
  String get transactionsHistory {
    return Intl.message(
      'Transaction History',
      name: 'transactionsHistory',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Something Went Wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something Went Wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Not now`
  String get notNow {
    return Intl.message(
      'Not now',
      name: 'notNow',
      desc: '',
      args: [],
    );
  }

  /// `Add Recipient`
  String get registerRecipient {
    return Intl.message(
      'Add Recipient',
      name: 'registerRecipient',
      desc: '',
      args: [],
    );
  }

  /// `We will access your contacts to find your friends & family on our platform. We do not store your contacts on our server.`
  String get contactPermissionDesc {
    return Intl.message(
      'We will access your contacts to find your friends & family on our platform. We do not store your contacts on our server.',
      name: 'contactPermissionDesc',
      desc: '',
      args: [],
    );
  }

  /// `We will access camera to take and upload image for user profile & verification document.`
  String get cameraPermissionDesc {
    return Intl.message(
      'We will access camera to take and upload image for user profile & verification document.',
      name: 'cameraPermissionDesc',
      desc: '',
      args: [],
    );
  }

  /// `We will access photos to select and upload image for user profile & verification document.`
  String get photosPermissionDesc {
    return Intl.message(
      'We will access photos to select and upload image for user profile & verification document.',
      name: 'photosPermissionDesc',
      desc: '',
      args: [],
    );
  }

  /// `We will access storage to select and upload image for user profile & verification document.`
  String get storagePermissionDesc {
    return Intl.message(
      'We will access storage to select and upload image for user profile & verification document.',
      name: 'storagePermissionDesc',
      desc: '',
      args: [],
    );
  }

  /// `Permission Denied!`
  String get permissionDenied {
    return Intl.message(
      'Permission Denied!',
      name: 'permissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `You have permanently denied for {permissionName} permission. To enable {permissionName} permission, you need to go to settings and allow us to access {permissionName}.`
  String permissionDeniedDesc(Object permissionName) {
    return Intl.message(
      'You have permanently denied for $permissionName permission. To enable $permissionName permission, you need to go to settings and allow us to access $permissionName.',
      name: 'permissionDeniedDesc',
      desc: '',
      args: [permissionName],
    );
  }

  /// `Go To Settings`
  String get goToSettings {
    return Intl.message(
      'Go To Settings',
      name: 'goToSettings',
      desc: '',
      args: [],
    );
  }

  /// `Contacts`
  String get contacts {
    return Intl.message(
      'Contacts',
      name: 'contacts',
      desc: '',
      args: [],
    );
  }

  /// `Photos`
  String get photos {
    return Intl.message(
      'Photos',
      name: 'photos',
      desc: '',
      args: [],
    );
  }

  /// `Storage`
  String get storage {
    return Intl.message(
      'Storage',
      name: 'storage',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `No Internet`
  String get noInternet {
    return Intl.message(
      'No Internet',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `Please check your network connection and try again.`
  String get noInternetDesc {
    return Intl.message(
      'Please check your network connection and try again.',
      name: 'noInternetDesc',
      desc: '',
      args: [],
    );
  }

  /// `Search Here ...`
  String get searchHere {
    return Intl.message(
      'Search Here ...',
      name: 'searchHere',
      desc: '',
      args: [],
    );
  }

  /// `Select Photo`
  String get selectPhoto {
    return Intl.message(
      'Select Photo',
      name: 'selectPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Take Photo`
  String get takePhoto {
    return Intl.message(
      'Take Photo',
      name: 'takePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Please enter mobile number!`
  String get pleaseEnterMobileNumber {
    return Intl.message(
      'Please enter mobile number!',
      name: 'pleaseEnterMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid mobile number!`
  String get pleaseEnterValidMobileNumber {
    return Intl.message(
      'Please enter valid mobile number!',
      name: 'pleaseEnterValidMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter password!`
  String get pleaseEnterPassword {
    return Intl.message(
      'Please enter password!',
      name: 'pleaseEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain 8 characters!`
  String get passwordLengthError {
    return Intl.message(
      'Password must contain 8 characters!',
      name: 'passwordLengthError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter email address!`
  String get pleaseEnterEmail {
    return Intl.message(
      'Please enter email address!',
      name: 'pleaseEnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid email address!`
  String get pleaseEnterValidEmail {
    return Intl.message(
      'Please enter valid email address!',
      name: 'pleaseEnterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `OTP Authentication`
  String get otpAuthentication {
    return Intl.message(
      'OTP Authentication',
      name: 'otpAuthentication',
      desc: '',
      args: [],
    );
  }

  /// `An authentication code been sent to`
  String get otpAuthenticationSubTitle {
    return Intl.message(
      'An authentication code been sent to',
      name: 'otpAuthenticationSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `I didn't received code.`
  String get didntReceivedCode {
    return Intl.message(
      'I didn\'t received code.',
      name: 'didntReceivedCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resendCode {
    return Intl.message(
      'Resend Code',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `Authenticate`
  String get authenticate {
    return Intl.message(
      'Authenticate',
      name: 'authenticate',
      desc: '',
      args: [],
    );
  }

  /// `Password Recovery`
  String get passwordRecoveryTitle {
    return Intl.message(
      'Password Recovery',
      name: 'passwordRecoveryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Phone number to recover your password`
  String get passwordRecoverySubTitle {
    return Intl.message(
      'Enter your Phone number to recover your password',
      name: 'passwordRecoverySubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get sendCode {
    return Intl.message(
      'Send Code',
      name: 'sendCode',
      desc: '',
      args: [],
    );
  }

  /// `Verify your identity`
  String get verifyIdentityTitle {
    return Intl.message(
      'Verify your identity',
      name: 'verifyIdentityTitle',
      desc: '',
      args: [],
    );
  }

  /// `We have just send code to`
  String get verifyIdentitySubTitle {
    return Intl.message(
      'We have just send code to',
      name: 'verifyIdentitySubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Please enter code!`
  String get pleaseEnterCode {
    return Intl.message(
      'Please enter code!',
      name: 'pleaseEnterCode',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid code!`
  String get pleaseEnterValidCode {
    return Intl.message(
      'Please enter valid code!',
      name: 'pleaseEnterValidCode',
      desc: '',
      args: [],
    );
  }

  /// `Reset your password`
  String get resetPasswordTitle {
    return Intl.message(
      'Reset your password',
      name: 'resetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `At least 8 characters with upparcase and lower letters`
  String get resetPasswordSubTitle {
    return Intl.message(
      'At least 8 characters with upparcase and lower letters',
      name: 'resetPasswordSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter confirm password!`
  String get pleaseEnterConfirmPassword {
    return Intl.message(
      'Please enter confirm password!',
      name: 'pleaseEnterConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Both passwords should be matched!`
  String get passwordMatchError {
    return Intl.message(
      'Both passwords should be matched!',
      name: 'passwordMatchError',
      desc: '',
      args: [],
    );
  }

  /// `Getting Started`
  String get registerTitle {
    return Intl.message(
      'Getting Started',
      name: 'registerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create an account to continue`
  String get registerSubTitle {
    return Intl.message(
      'Create an account to continue',
      name: 'registerSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you are agree to our`
  String get signUpInstruction {
    return Intl.message(
      'By creating an account, you are agree to our',
      name: 'signUpInstruction',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name!`
  String get pleaseEnterYourName {
    return Intl.message(
      'Please enter your name!',
      name: 'pleaseEnterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter address!`
  String get pleaseEnterAddress {
    return Intl.message(
      'Please enter address!',
      name: 'pleaseEnterAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter date of birth!`
  String get pleaseEnterDateOfBirth {
    return Intl.message(
      'Please enter date of birth!',
      name: 'pleaseEnterDateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Add Card`
  String get addCard {
    return Intl.message(
      'Add Card',
      name: 'addCard',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `The easiest way to transaction and save your money`
  String get welcomeText {
    return Intl.message(
      'The easiest way to transaction and save your money',
      name: 'welcomeText',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Transactions`
  String get transactions {
    return Intl.message(
      'Transactions',
      name: 'transactions',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Add New Card`
  String get addNewCard {
    return Intl.message(
      'Add New Card',
      name: 'addNewCard',
      desc: '',
      args: [],
    );
  }

  /// `Update Card Detail`
  String get updateCard {
    return Intl.message(
      'Update Card Detail',
      name: 'updateCard',
      desc: '',
      args: [],
    );
  }

  /// `Last Transactions`
  String get recentTransactions {
    return Intl.message(
      'Last Transactions',
      name: 'recentTransactions',
      desc: '',
      args: [],
    );
  }

  /// `Card Details`
  String get cardDetails {
    return Intl.message(
      'Card Details',
      name: 'cardDetails',
      desc: '',
      args: [],
    );
  }

  /// `Card Number`
  String get cardNumber {
    return Intl.message(
      'Card Number',
      name: 'cardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get updateProfile {
    return Intl.message(
      'Update Profile',
      name: 'updateProfile',
      desc: '',
      args: [],
    );
  }

  /// `Card Holder Name`
  String get cardHolderName {
    return Intl.message(
      'Card Holder Name',
      name: 'cardHolderName',
      desc: '',
      args: [],
    );
  }

  /// `Expiration Date`
  String get expirationDate {
    return Intl.message(
      'Expiration Date',
      name: 'expirationDate',
      desc: '',
      args: [],
    );
  }

  /// `CVV`
  String get cvv {
    return Intl.message(
      'CVV',
      name: 'cvv',
      desc: '',
      args: [],
    );
  }

  /// `Enter CVV`
  String get enterCvv {
    return Intl.message(
      'Enter CVV',
      name: 'enterCvv',
      desc: '',
      args: [],
    );
  }

  /// `Enter Date`
  String get enterDate {
    return Intl.message(
      'Enter Date',
      name: 'enterDate',
      desc: '',
      args: [],
    );
  }

  /// `Enter Card Holder Name`
  String get enterCardHolderName {
    return Intl.message(
      'Enter Card Holder Name',
      name: 'enterCardHolderName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Card Number`
  String get enterCardNumber {
    return Intl.message(
      'Enter Card Number',
      name: 'enterCardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter card month!`
  String get pleaseEnterCardMonth {
    return Intl.message(
      'Please enter card month!',
      name: 'pleaseEnterCardMonth',
      desc: '',
      args: [],
    );
  }

  /// `Please enter card number!`
  String get pleaseEnterCardNumber {
    return Intl.message(
      'Please enter card number!',
      name: 'pleaseEnterCardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid card number!`
  String get pleaseEnterValidCardNumber {
    return Intl.message(
      'Please enter valid card number!',
      name: 'pleaseEnterValidCardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid card month!`
  String get pleaseEnterValidCardMonth {
    return Intl.message(
      'Please enter valid card month!',
      name: 'pleaseEnterValidCardMonth',
      desc: '',
      args: [],
    );
  }

  /// `Please enter card holder name!`
  String get pleaseEnterCardHolderName {
    return Intl.message(
      'Please enter card holder name!',
      name: 'pleaseEnterCardHolderName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter CVV!`
  String get pleaseEnterCVV {
    return Intl.message(
      'Please enter CVV!',
      name: 'pleaseEnterCVV',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid CVV!`
  String get pleaseEnterValidCVV {
    return Intl.message(
      'Please enter valid CVV!',
      name: 'pleaseEnterValidCVV',
      desc: '',
      args: [],
    );
  }

  /// `Card Added Successfully`
  String get cardAddedSuccessfully {
    return Intl.message(
      'Card Added Successfully',
      name: 'cardAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Now you can freely transfer and withdraw money, Enjoy it!`
  String get cardAddedSuccessDesc {
    return Intl.message(
      'Now you can freely transfer and withdraw money, Enjoy it!',
      name: 'cardAddedSuccessDesc',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_ {
    return Intl.message(
      'Continue',
      name: 'continue_',
      desc: '',
      args: [],
    );
  }

  /// `Enter Amount`
  String get enterAmount {
    return Intl.message(
      'Enter Amount',
      name: 'enterAmount',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get information {
    return Intl.message(
      'Information',
      name: 'information',
      desc: '',
      args: [],
    );
  }

  /// `Receivable Amount`
  String get receivableAmount {
    return Intl.message(
      'Receivable Amount',
      name: 'receivableAmount',
      desc: '',
      args: [],
    );
  }

  /// `Fees`
  String get fees {
    return Intl.message(
      'Fees',
      name: 'fees',
      desc: '',
      args: [],
    );
  }

  /// `Go to Home`
  String get goToHome {
    return Intl.message(
      'Go to Home',
      name: 'goToHome',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `All Contacts`
  String get allContacts {
    return Intl.message(
      'All Contacts',
      name: 'allContacts',
      desc: '',
      args: [],
    );
  }

  /// `Refresh`
  String get refresh {
    return Intl.message(
      'Refresh',
      name: 'refresh',
      desc: '',
      args: [],
    );
  }

  /// `By Signin, you agree to our`
  String get signInInstruction {
    return Intl.message(
      'By Signin, you agree to our',
      name: 'signInInstruction',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Condition`
  String get termsAndCondition {
    return Intl.message(
      'Terms & Condition',
      name: 'termsAndCondition',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
