part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class UserBProfileSuccessState extends ProfileState {

  const UserBProfileSuccessState({required this.userBProfile});
  final UserBProfile userBProfile;

  @override
  List<Object?> get props => [userBProfile];
}

class UserBProfilesSuccessState extends ProfileState {
  UserBProfilesSuccessState({required this.userBProfiles});
  final List<UserBProfile> userBProfiles;


  @override
  List<Object?> get props => [userBProfiles];
}

class ProfileFailureState extends ProfileState {
  const ProfileFailureState({required this.error});
  final Failure error;

  @override
  List<Object?> get props => [error];
}