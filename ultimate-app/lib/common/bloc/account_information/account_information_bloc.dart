import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/common/bloc/account_information%20/account_information_bloc.dart';
import 'package:flutter_ultimate/core/error/exception.dart';
import 'package:flutter_ultimate/data/models/account_info_model.dart';
import 'package:flutter_ultimate/data/models/authentication_model.dart';
import 'package:flutter_ultimate/data/repositories/auth/auth_repo.dart';

import '../../../data/models/login_request_model.dart';
import '../../../data/models/login_response_model.dart';

part 'account_information_event.dart';
part 'account_information_state.dart';

class AccountInfoBloc extends Bloc<AccInfoEvent, AccInfoState> {
  AccountInfoBloc({
    required this.authenticationRepository,
  }) : super(AccInfoInitialState()) {
    on<AddAccInfoEvent>(_addAccInfo);
  }
  final AuthenticationRepository authenticationRepository;

  AccInfoState accInfoSuccessOrFailure(dynamic result) {
    if (result is AccInfoResponseModel) {
      return const AccInfoSuccessState();
    } else {
      return const AccInfoSuccessState();
    }
  }

  void _addAccInfo(AddAccInfoEvent event, Emitter<AccInfoState> emit) async {
    emit(AccInfoLoadingState());
    try {
      final result =
          await authenticationRepository.addAccountInfo(event.accInfo);
      emit(accInfoSuccessOrFailure(result));
    } on NoInternetException catch (e) {
      emit(
        accInfoSuccessOrFailure(e.message),
      );
    } on ConnectionTimeOutException catch (e) {
      emit(
        accInfoSuccessOrFailure(e.message),
      );
    } on ServerException catch (e) {
      emit(
        accInfoSuccessOrFailure(e.message),
      );
    } on UnknownException catch (e) {
      emit(
        accInfoSuccessOrFailure(e.message),
      );
    }
  }
}
