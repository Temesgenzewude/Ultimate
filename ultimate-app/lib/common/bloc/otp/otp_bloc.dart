import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/error/exception.dart';
import '../../../data/repositories/auth/auth_repo.dart';
import 'otp_event.dart';
import 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc({required this.authRepository}) : super(OtpInitial()) {
    on<OtpSent>(_mapOtpSentToState);
    on<OtpVerified>(_mapOtpVerifiedToState);
    on<OTPSendUserA>(_handleOTPSendUserA);
    on<OTPVerifyUserA>(_handleOTPVerifyUserA);
  }
  final AuthenticationRepository authRepository;

  Future<void> _mapOtpSentToState(OtpSent event, Emitter<OtpState> emit) async {
    try {
      emit(OtpLoading());
      final result = await authRepository.sendOTP();
      emit(OtpSentSuccess());
    } on ForbiddenResponseException catch (e) {
      emit(OtpSentFailure(message: e.message));
    } on NoInternetException catch (e) {
      emit(OtpSentFailure(message: e.message));
    } on ConnectionTimeOutException catch (e) {
      emit(OtpSentFailure(message: e.message));
    } on UnknownException catch (e) {
      emit(OtpSentFailure(message: e.message));
    } on ServerException catch (e) {
      emit(OtpSentFailure(message: e.message));
    }
  }

  Future<void> _mapOtpVerifiedToState(
      OtpVerified event, Emitter<OtpState> emit) async {
    try {
      emit(OtpVerifiedLoading());
      final result = await authRepository.verifyOTPApi(event.otp);
      emit(OtpVerifiedSuccess(loginResponseModel: result));
    } on ForbiddenResponseException catch (e) {
      emit(OtpVerifiedFailure(message: e.message));
    } on NoInternetException catch (e) {
      emit(OtpVerifiedFailure(message: e.message));
    } on ConnectionTimeOutException catch (e) {
      emit(OtpVerifiedFailure(message: e.message));
    } on UnknownException catch (e) {
      emit(OtpVerifiedFailure(message: e.message));
    } on ServerException catch (e) {
      emit(OtpVerifiedFailure(message: e.message));
    }
  }

  FutureOr<void> _handleOTPSendUserA(
      OTPSendUserA event, Emitter<OtpState> emit) {
    emit(OtpLoading());

    try {
      authRepository.sendOTPUserA();
      emit(OtpSentSuccess());
    } on ForbiddenResponseException catch (e) {
      emit(OtpSentFailure(message: e.message));
    } on NoInternetException catch (e) {
      emit(OtpSentFailure(message: e.message));
    } on ConnectionTimeOutException catch (e) {
      emit(OtpSentFailure(message: e.message));
    } on UnknownException catch (e) {
      emit(OtpSentFailure(message: e.message));
    } on ServerException catch (e) {
      emit(OtpSentFailure(message: e.message));
    }
  }

  FutureOr<void> _handleOTPVerifyUserA(
      OTPVerifyUserA event, Emitter<OtpState> emit) async {
    emit(OtpVerifiedLoading());

    try {
      final result = await authRepository.verifyOTPUserA(event.otp);
      emit(OtpVerifiedSuccess(loginResponseModel: result));
    } on ForbiddenResponseException catch (e) {
      emit(OtpVerifiedFailure(message: e.message));
    } on NoInternetException catch (e) {
      emit(OtpVerifiedFailure(message: e.message));
    } on ConnectionTimeOutException catch (e) {
      emit(OtpVerifiedFailure(message: e.message));
    } on UnknownException catch (e) {
      emit(OtpVerifiedFailure(message: e.message));
    } on ServerException catch (e) {
      emit(OtpVerifiedFailure(message: e.message));
    }
  }
}
