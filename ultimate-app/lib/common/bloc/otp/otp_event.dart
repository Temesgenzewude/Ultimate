import 'package:equatable/equatable.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object> get props => [];
}

class OtpSent extends OtpEvent {
  final String phoneNumber;

  const OtpSent(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class OtpVerified extends OtpEvent {
  final String otp;

  const OtpVerified(this.otp);

  @override
  List<Object> get props => [otp];
}