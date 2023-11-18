import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/data/models/authentication_model.dart';
import 'package:flutter_ultimate/data/repositories/auth/auth_repo.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required this.authenticationRepository,
  }) : super(AuthenticationInitialState()) {
    on<SignInEvent>(_signIn);
    on<SignUpEvent>(_signUp);
  }
  final AuthenticationRepository authenticationRepository;

  AuthenticationState authenticationSuccessOrFailure(dynamic result) {
    print(" thiis is result : ${result}");
    if (result is AuthenticationModel) {
      return AuthenticationSuccessState(user: result);
    } else if (result is String) {
      return AuthenticationFailureState(errorMessage: result);
    } else {
      // Handle other cases if needed
      return const AuthenticationFailureState(errorMessage: 'Unexpected error');
    }
  }

  void _signIn(SignInEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoadingState());
    final result = await authenticationRepository.signin(event.user);

    emit(authenticationSuccessOrFailure(result));
  }

  void _signUp(SignUpEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoadingState());
    try {
      final result = await authenticationRepository.signup(event.newUser);
      emit(authenticationSuccessOrFailure(result));
    } catch (e) {
      String errorMessage = "An unexpected error occurred.";
      if (e is Exception) {
        errorMessage = e.toString();
      }
      print("this is error message: ${errorMessage}");
      emit(authenticationSuccessOrFailure(errorMessage));
    }
  }

  bool isAuthenticated() {
    return state is AuthenticationSuccessState;
  }
}
