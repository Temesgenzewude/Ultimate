import 'package:equatable/equatable.dart';

abstract class SliderEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SwipeReset extends SliderEvent {}

class SwipeRight extends SliderEvent {}

class SwipeLeft extends SliderEvent {}
