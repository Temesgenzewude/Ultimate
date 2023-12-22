part of 'settings_bloc.dart';

abstract class NotificationSettingsEvent extends Equatable {
  const NotificationSettingsEvent();

  @override
  List<Object> get props => [];
}

class ToggleAdminNotificationVisibility extends NotificationSettingsEvent {}

class ToggleFeedVisibility extends NotificationSettingsEvent {}

class ToggleUserNotificationVisibility extends NotificationSettingsEvent {}
