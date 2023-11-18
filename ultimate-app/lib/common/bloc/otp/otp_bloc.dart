import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/data/repositories/auth/auth_repo.dart';

import 'otp_event.dart';
import 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc({required this.authRepository}) : super(OtpInitial()) {
    on<OtpSent>(_mapOtpSentToState);
    on<OtpVerified>(_mapOtpVerifiedToState);
  }
  final AuthenticationRepository authRepository;

  Future<void> _mapOtpSentToState(OtpSent event, Emitter<OtpState> emit) async {
    try {
      await authRepository.sendOTPByPhoneNumberApiCall(
          event.phoneNumber, event.id);
      emit(OtpSentSuccess());
    } catch (error) {
      emit(OtpSentFailure());
    }
  }

  Future<void> _mapOtpVerifiedToState(
      OtpVerified event, Emitter<OtpState> emit) async {
    try {
      await authRepository.verifyOTPApi(event.otp, event.id);
      emit(OtpVerifiedSuccess());
    } catch (error) {
      emit(OtpVerifiedFailure());
    }
  }
}
