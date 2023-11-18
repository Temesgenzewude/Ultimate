import 'package:equatable/equatable.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object> get props => [];
}

class OtpSent extends OtpEvent {
  final String phoneNumber;
  final String id;

  const OtpSent(this.phoneNumber, this.id);

  @override
  List<Object> get props => [phoneNumber, id];
}

class OtpVerified extends OtpEvent {
  final String otp;
  final String id;

  const OtpVerified(this.otp, this.id);

  @override
  List<Object> get props => [otp, id];
}
