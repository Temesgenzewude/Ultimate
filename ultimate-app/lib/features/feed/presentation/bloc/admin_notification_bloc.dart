// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/core/error/failure.dart';
import 'package:flutter_ultimate/features/feed/domain/entities/notification_entitiy.dart';
import 'package:flutter_ultimate/features/feed/domain/usecases/get_admin_notification.dart';

part 'admin_notification_event.dart';
part 'admin_notification_state.dart';

class AdminNotificationBloc extends Bloc<AdminNotificationEvent, AdminNotificationState> {
  AdminNotificationBloc({
    required this.getAdminNotifications,
  }) : super(AdminNotificationInitialState()) {
    on<GetAdminNotificationsEvent>(_getAdminNotification);

  }
  final GetAdminNotification getAdminNotifications;

  // success or failure converter for getNews usecase
  AdminNotificationState adminNotificationsSuccessOrFailure(
      Either<Failure, List<NotificationEntity>> data) {
    return data.fold(
      (failure) => AdminNotificationFailureState(error: failure),
      (success) => AdminNotificationSuccessState(adminNotifications: success),
    );
  }

  Future<void> _getAdminNotification(
      GetAdminNotificationsEvent event, Emitter<AdminNotificationState> emit) async {
    emit(AdminNotificationLoadingState());

    final result = await getAdminNotifications();
    emit(adminNotificationsSuccessOrFailure(result));
  }
}
