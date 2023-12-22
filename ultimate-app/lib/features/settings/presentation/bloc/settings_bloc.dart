// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/features/authentication/data/data_sources/auth_remote_data_source.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class NotificationSettingsBloc
    extends Bloc<NotificationSettingsEvent, NotificationSettingsState> {
  NotificationSettingsBloc() : super(NotificationSettingsInitialState()) {
    _loadInitialState().then((initialState) => emit(initialState));

    on<ToggleAdminNotificationVisibility>(
      (event, emit) async {
        emit(
          state.copyWith(
            adminNotificationVisibility: !state.adminNotificationVisibility,
          ),
        );
        prefManager.adminNotification = state.adminNotificationVisibility;
      },
    );

    on<ToggleFeedVisibility>(
      (event, emit) async {
        emit(
          state.copyWith(
            feedVisibility: !state.feedVisibility,
          ),
        );
        prefManager.feedNotification = state.feedVisibility;
      },
    );

    on<ToggleUserNotificationVisibility>(
      (event, emit) async {
        emit(
          state.copyWith(
            userNotificationVisibility: !state.userNotificationVisibility,
          ),
        );
        prefManager.userNotification = state.userNotificationVisibility;
      },
    );
  }

  static Future<NotificationSettingsState> _loadInitialState() async {
    final adminNotificationVisibility = prefManager.adminNotification ?? true;
    final feedVisibility = prefManager.feedNotification ?? true;
    final userNotificationVisibility = prefManager.userNotification ?? true;
    return NotificationSettingsState(
      adminNotificationVisibility: adminNotificationVisibility,
      feedVisibility: feedVisibility,
      userNotificationVisibility: userNotificationVisibility,
    );
  }
}
