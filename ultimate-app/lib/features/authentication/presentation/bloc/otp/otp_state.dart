import 'package:equatable/equatable.dart';
import 'package:flutter_ultimate/features/authentication/data/models/login_response_model.dart';



abstract class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpVerifiedLoading extends OtpState {}

class OtpSentSuccess extends OtpState {}

class OtpSentFailure extends OtpState {
  const OtpSentFailure({required this.message});

  final String message;
}

class OtpVerifiedSuccess extends OtpState {
  const OtpVerifiedSuccess({required this.loginResponseModel});

  final LoginResponseModel loginResponseModel;
}

class OtpVerifiedFailure extends OtpState {
  const OtpVerifiedFailure({required this.message});
  final String message;
}
