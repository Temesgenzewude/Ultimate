import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/core/error/exception.dart';
import 'package:flutter_ultimate/features/authentication/data/models/account_info_model.dart';
import 'package:flutter_ultimate/features/authentication/data/repositories/auth_repo.dart';

part 'account_information_event_b.dart';
part 'account_information_state_b.dart';

class UserBAccountInfoBloc extends Bloc<UserBAccInfoEvent, UserBAccInfoState> {
  UserBAccountInfoBloc({
    required this.authenticationRepository,
  }) : super(UserBAccInfoInitialState()) {
    on<UserBAddAccInfoEvent>(_addAccInfo);
  }
  final AuthenticationRepository authenticationRepository;

  UserBAccInfoState accInfoSuccessOrFailure(dynamic result) {
    if (result is AccInfoResponseModel) {
      return const UserBAccInfoSuccessState();
    } else if (result is String) {
      return UserBAccFailureState(errorMessage: result);
    } else {
      return const UserBAccFailureState(errorMessage: 'Unexpected error');
    }
  }

  void _addAccInfo(
      UserBAddAccInfoEvent event, Emitter<UserBAccInfoState> emit) async {
    emit(UserBAccInfoLoadingState());
    try {
      final result =
          await authenticationRepository.userBAddAccountInfo(event.accInfo);
      emit(accInfoSuccessOrFailure(result));
    } on NoInternetException catch (e) {
      emit(
        accInfoSuccessOrFailure(e.message),
      );
    } on ForbiddenResponseException catch (e) {
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
