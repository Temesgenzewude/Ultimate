import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class CheckInternet {
  Future<bool> get isConnected;
}

class CheckInternetImpl implements CheckInternet {
  CheckInternetImpl({required this.internetConnectionChecker});
  final InternetConnectionChecker internetConnectionChecker;

  @override
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;
}
