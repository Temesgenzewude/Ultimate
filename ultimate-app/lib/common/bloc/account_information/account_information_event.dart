part of 'account_information_bloc.dart';


// Define an abstract class for account information events
abstract class AccInfoEvent {
  const AccInfoEvent();
}

// Define a specific event for adding account information
class AddAccInfoEvent extends AccInfoEvent {
  AddAccInfoEvent({required this.accInfo});
  final AccountInfoModel accInfo;
}

