part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object?> get props => [];
}

class NotificationInitialState extends NotificationState {}

class NotificationLoadingState extends NotificationState {}

class UserNotificationSuccessState extends NotificationState {
  const UserNotificationSuccessState({required this.userNotifications});
  final List<NotificationEntity> userNotifications;

  @override
  List<Object?> get props => [userNotifications];
}

class UserNotificationFailureState extends NotificationState {
  const UserNotificationFailureState({required this.error});
  final Failure error;

  @override
  List<Object?> get props => [error];
}
