// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/core/error/failure.dart';
import 'package:flutter_ultimate/features/feed/domain/entities/notification_entitiy.dart';
import 'package:flutter_ultimate/features/feed/domain/usecases/get_user_notification.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc({
    required this.getUserNotifications,
  }) : super(NotificationInitialState()) {
    on<GetUserNotificationsEvent>(_getUserNotification);
  }

  final GetUserNotification getUserNotifications;

  // success or failure converter for getAllNews usecase
  NotificationState userNotificationsSuccessOrFailure(
      Either<Failure, List<NotificationEntity>> data) {
    return data.fold(
      (failure) => UserNotificationFailureState(error: failure),
      (success) => UserNotificationSuccessState(userNotifications: success),
    );
  }

  Future<void> _getUserNotification(
      GetUserNotificationsEvent event, Emitter<NotificationState> emit) async {
    emit(NotificationLoadingState());

    final result = await getUserNotifications();
    emit(userNotificationsSuccessOrFailure(result));
  }
}
