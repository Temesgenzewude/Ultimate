import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/data/repositories/auth/auth_repo.dart';

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
      await authRepository.sendOTP();
      emit(OtpSentSuccess());
    } catch (error) {
      emit(OtpSentFailure());
    }
  }

  Future<void> _mapOtpVerifiedToState(
      OtpVerified event, Emitter<OtpState> emit) async {
    try {
      emit(OtpVerifiedLoading());
      await authRepository.verifyOTPApi(event.otp);
      emit(OtpVerifiedSuccess());
    } catch (error) {
      emit(OtpVerifiedFailure());
    }
  }

  FutureOr<void> _handleOTPSendUserA(
      OTPSendUserA event, Emitter<OtpState> emit) {
    emit(OtpLoading());

    try {
      authRepository.sendOTPUserA();
      emit(OtpSentSuccess());
    } catch (error) {
      emit(OtpSentFailure());
    }
  }

  FutureOr<void> _handleOTPVerifyUserA(
      OTPVerifyUserA event, Emitter<OtpState> emit) {
    emit(OtpVerifiedLoading());

    try {
      authRepository.verifyOTPUserA(event.otp);
      emit(OtpVerifiedSuccess());
    } catch (error) {
      emit(OtpVerifiedFailure());
    }
  }
}
