import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/core/error/failure.dart';
import 'package:flutter_ultimate/features/profiles/domain/usecases/subscribe_to_user_b.dart';

part 'subscription_bloc_event.dart';
part 'subscription_bloc_state.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  SubscriptionBloc({
    required this.subscribeToUserB,
  }) : super(SubscriptionInitialState()) {
    on<SubscribeToUserBEvent>(_subscribeToUserB);
  }

  final SubscribeToUserB subscribeToUserB;

  SubscriptionState subscriptionSuccessOrFailure(Either<Failure, bool> data) {
    return data.fold(
      (failure) => SubscriptionFailureState(error: failure),
      (success) => SubscriptionSuccessState(),
    );
  }

  Future<void> _subscribeToUserB(
      SubscribeToUserBEvent event, Emitter<SubscriptionState> emit) async {
    emit(SubscriptionLoadingState());
    print('id in bloc ${event.userBId}');
    final result = await subscribeToUserB(event.userBId);

    emit(subscriptionSuccessOrFailure(result));
  }
}
