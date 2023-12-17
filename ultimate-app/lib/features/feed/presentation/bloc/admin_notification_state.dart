part of 'admin_notification_bloc.dart';

abstract class AdminNotificationState extends Equatable {
  const AdminNotificationState();

  @override
  List<Object?> get props => [];
}

class AdminNotificationInitialState extends AdminNotificationState {}

class AdminNotificationLoadingState extends AdminNotificationState {}

class AdminNotificationSuccessState extends AdminNotificationState {
  const AdminNotificationSuccessState({required this.adminNotifications});
  final List<NotificationEntity> adminNotifications;

  @override
  List<Object?> get props => [adminNotifications];
}

class AdminNotificationFailureState extends AdminNotificationState {
  const AdminNotificationFailureState({required this.error});
  final Failure error;

  @override
  List<Object?> get props => [error];
}
