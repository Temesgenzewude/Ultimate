// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:flutter_ultimate/common/constant/images.dart';
import 'package:flutter_ultimate/features/profiles/presentation/bloc/subscription_bloc/bloc/subscription_bloc.dart';

class SubscriptionBuilder extends StatefulWidget {
  SubscriptionBuilder({super.key, required this.state});
  SubscriptionState state;
  @override
  State<SubscriptionBuilder> createState() => _SubscriptionBuilderState();
}

class _SubscriptionBuilderState extends State<SubscriptionBuilder> {
  @override
  Widget build(BuildContext context) {
    if (widget.state is SubscriptionSuccessState) {
      // Subscription was successful
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white, // Change color accordingly
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else if (widget.state is SubscriptionFailureState) {
      // Subscription failed
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.red, // Change color accordingly
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Text(
          'Subscription Failed',
          style: TextStyle(color: Colors.white),
        ),
      );
    } else {
      // Subscription is in progress or initial state
      return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: green,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Image.asset(
          addUser,
          width: 24,
          height: 24,
          color: grey1100,
        ),
      );
    }
  }
}
