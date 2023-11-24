part of 'account_information_bloc.dart';

abstract class AccInfoEvent {
  const AccInfoEvent();
}

class AddAccInfoEvent extends AccInfoEvent {
  AddAccInfoEvent({required this.accInfo});
  final AccountInfoModel accInfo;
}
