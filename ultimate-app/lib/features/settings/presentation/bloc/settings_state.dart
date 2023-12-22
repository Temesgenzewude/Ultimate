part of 'settings_bloc.dart';

class NotificationSettingsState extends Equatable {
  final bool adminNotificationVisibility;
  final bool feedVisibility;
  final bool userNotificationVisibility;

  const NotificationSettingsState({
    this.adminNotificationVisibility = true,
    this.feedVisibility = true,
    this.userNotificationVisibility = true,
  });

  NotificationSettingsState copyWith({
    bool? adminNotificationVisibility,
    bool? feedVisibility,
    bool? userNotificationVisibility,
  }) {
    return NotificationSettingsState(
      adminNotificationVisibility:
          adminNotificationVisibility ?? this.adminNotificationVisibility,
      feedVisibility: feedVisibility ?? this.feedVisibility,
      userNotificationVisibility:
          userNotificationVisibility ?? this.userNotificationVisibility,
    );
  }

  @override
  List<Object> get props => [
        adminNotificationVisibility,
        feedVisibility,
        userNotificationVisibility,
      ];
}

class NotificationSettingsInitialState extends NotificationSettingsState {}
