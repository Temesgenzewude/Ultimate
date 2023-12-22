import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/features/authentication/data/data_sources/auth_remote_data_source.dart';

// Events
abstract class NotificationSettingsEvent {}

class ToggleNotificationEvent extends NotificationSettingsEvent {
  ToggleNotificationEvent({required this.type, required this.value});
  final String type;
  final bool value;
}

class GetNotificationStateEvent extends NotificationSettingsEvent {}

// abstract class NotificationSettingsState {}

// States
class NotificationSettingsState {
  NotificationSettingsState({required this.switchStates});
  final Map<String, bool> switchStates;
}

// class GetNotificationSettingsState extends NotificationSettingsState{
//   GetNotificationSettingsState({required this.switchStates});
//   final Map<String, bool> switchStates;
// }

// Bloc
class NotificationSettingsBloc
    extends Bloc<NotificationSettingsEvent, NotificationSettingsState> {
  NotificationSettingsBloc()
      : super(NotificationSettingsState(switchStates: {
          'messageNotification': prefManager.messageNotification ?? true,
          'newsNotification': prefManager.newsNotification ?? true,
          'adminNotification': prefManager.adminNotification ?? true,
        })) {
    on<ToggleNotificationEvent>(_toggleNotifications);
    // on<GetNotificationStateEvent>(_getNotifications);
  }

  Future<void> _toggleNotifications(ToggleNotificationEvent event,
      Emitter<NotificationSettingsState> emit) async {
    final Map<String, bool> updatedSwitchStates = Map.from(state.switchStates)
      ..[event.type] = event.value;

    emit(NotificationSettingsState(switchStates: updatedSwitchStates));
    if (event.type == 'messageNotification') {
      prefManager.messageNotification = event.value;
    } else if (event.type == 'newsNotification') {
      prefManager.newsNotification = event.value;
    } else if (event.type == 'adminNotification') {
      prefManager.adminNotification = event.value;
    }
  }

  // Future<void> _getNotifications(GetNotificationStateEvent event,
  //     Emitter<NotificationSettingsState> emit) async {
  //   final Map<String, bool> switches = {
  //     'messageNotification' : prefManager.messageNotification ?? true,
  //     'newsNotification' : prefManager.newsNotification ?? true,
  //     'adminNotification' : prefManager.adminNotification ?? true,
  //   };

  //   emit(GetNotificationSettingsState(switchStates: switches));
  // }

  // Stream<NotificationSettingsState> mapEventToState(
  //     NotificationSettingsEvent event) async* {
  //   if (event is ToggleNotificationEvent) {
  //     final Map<String, bool> updatedSwitchStates = Map.from(state.switchStates)
  //       ..[event.type] = event.value;
  //     yield NotificationSettingsState(switchStates: updatedSwitchStates);

  //     // Update shared preferences here
  //     if (event.type == 'messageNotification') {
  //       prefManager.messageNotification = event.value;
  //     } else if (event.type == 'newsNotification') {
  //       prefManager.newsNotification = event.value;
  //     } else if (event.type == 'adminNotificaion') {
  //       prefManager.adminNotification = event.value;
  //     }
  //   }
  // }
}
