import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure(this.message);
  final String message;
}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {
  const NetworkFailure(this.message);
  final String message;
}

class LoginFailure extends Failure {}

class SignUpFailure extends Failure {}

class LogoutFailure extends Failure {}
