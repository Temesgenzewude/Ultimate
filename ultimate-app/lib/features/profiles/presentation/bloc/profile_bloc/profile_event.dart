part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetProfilesEvent extends ProfileEvent {}

class GetProfileByIdEvent extends ProfileEvent {
  GetProfileByIdEvent({required this.userId});
  final String userId;

  List<Object?> get props => [userId];
}
