import 'package:equatable/equatable.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object> get props => [];
}

class OtpSent extends OtpEvent {}

class OtpVerified extends OtpEvent {
  const OtpVerified(this.otp);
  final String otp;

  @override
  List<Object> get props => [otp];
}

class OTPSendUserA extends OtpEvent {}

class OTPVerifyUserA extends OtpEvent {
  const OTPVerifyUserA(this.otp);
  final String otp;

  @override
  List<Object> get props => [otp];
}
