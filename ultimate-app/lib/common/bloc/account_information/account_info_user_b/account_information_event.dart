part of 'account_information_bloc.dart';

abstract class UserBAccInfoEvent {
  const UserBAccInfoEvent();
}

class UserBAddAccInfoEvent extends UserBAccInfoEvent {
  UserBAddAccInfoEvent({required this.accInfo});
  final AccountInfoModel accInfo;
}
