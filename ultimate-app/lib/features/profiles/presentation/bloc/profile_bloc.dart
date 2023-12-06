import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/core/error/failure.dart';
import 'package:flutter_ultimate/features/profiles/domain/entities/user_b_profile_entity.dart';
import 'package:flutter_ultimate/features/profiles/domain/usecases/getUserB.dart';
import 'package:flutter_ultimate/features/profiles/domain/usecases/getUserBProfiles.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required this.getUserBProfile,
    required this.getUserBProfiles,
  }) : super(ProfileInitialState()) {
    on<GetProfilesEvent>(_getUserBProfiles);
    on<GetProfileByIdEvent>(_getUserBProfile);
  }

  final GetUserBProfile getUserBProfile;
  final GetUserBProfiles getUserBProfiles;

  ProfileState profileBSuccessOrFailure(Either<Failure, UserBProfile> data) {
    print("DATATATATA");
    print(data);
    return data.fold(
      (failure) => ProfileFailureState(error: failure),
      (success) => UserBProfileSuccessState(userBProfile: success),
    );
  }

  ProfileState profilesBSuccessOrFailure(
      Either<Failure, List<UserBProfile>> data) {
    return data.fold(
      (failure) => ProfileFailureState(error: failure),
      (success) => UserBProfilesSuccessState(userBProfiles: success),
    );
  }

  Future<void> _getUserBProfile(
      GetProfileByIdEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());

    final result = await getUserBProfile(event.userId);
    print('-------------- result ---------------');
    print(result);
    print('--------------- result');
    emit(profileBSuccessOrFailure(result));
  }

  Future<void> _getUserBProfiles(
      GetProfilesEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());

    final result = await getUserBProfiles();
    emit(profilesBSuccessOrFailure(result));
  }
}
