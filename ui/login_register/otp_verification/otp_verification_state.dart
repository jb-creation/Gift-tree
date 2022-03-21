part of 'otp_verification_view.dart';

class OtpVerificationState extends Equatable {
  final TextEditingController otpController;
  final String type;
  final String mobileNumber;
  final bool isValid;
  final String error;

  const OtpVerificationState(this.otpController, this.type, this.mobileNumber ,{ this.isValid = true, this.error = ""});

  @override
  List<Object?> get props => [isValid, error];

  OtpVerificationState copyWith({bool? isValid, String? error}) {
    return OtpVerificationState(
      otpController,
      type,
      mobileNumber,
      isValid: isValid ?? this.isValid,
      error: error ?? this.error,
    );
  }
}
