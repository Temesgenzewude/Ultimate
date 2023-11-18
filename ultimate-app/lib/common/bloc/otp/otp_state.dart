import 'package:equatable/equatable.dart';

abstract class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

class OtpInitial extends OtpState {}

class OtpSentSuccess extends OtpState {}

class OtpSentFailure extends OtpState {}

class OtpVerifiedSuccess extends OtpState {}

class OtpVerifiedFailure extends OtpState {}
