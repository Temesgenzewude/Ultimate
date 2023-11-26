import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/app/widget_support.dart';
import 'package:flutter_ultimate/common/bloc/auth/authentication_bloc.dart';
import 'package:flutter_ultimate/common/util/show_toast_message.dart';
import 'package:flutter_ultimate/sharedPreferences.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/route/routes.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../dependency_indjection.dart';
import '../widget/item.dart';

List<Map<String, dynamic>> items = [
  <String, dynamic>{
    'avt': avtFemale,
    'name': 'Albert Flores',
    'bgImage': [bgOb1, bgOb12],
    'music': 'Why Do You Love Me',
    'time': '15 mins ago',
    'bgColor': grey200,
    'crown': '12k',
    'chat': '234',
    'share': '528'
  },
  <String, dynamic>{
    'avt': avtMale,
    'name': 'Albert Flores',
    'bgImage': [imagePost1, imagePost1, imagePost1],
    'time': '20 mins ago',
    'music': 'Why Do You Love Me',
    'crown': '12k',
    'chat': '234',
    'share': '528'
  }
];

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        left: AnimationClick(
          child: Container(
            margin: const EdgeInsets.only(left: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(24)),
            child: Image.asset(
              popcorn,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
        center: Text(
          'Feed',
          style: title4(color: grey1100),
        ),
        right: AnimationClick(
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(24)),
            child: Image.asset(
              user,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
                    listener: (context, state) {
                      if (state is LogoutSuccessState) {
                        Utils.snackBar(context, message: 'Logout Success');
          
                        Future.delayed(const Duration(seconds: 1), () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, Routes.onBoarding1, (route) => false);
                        });
                      } else if (state is LogoutFailureState) {
                        Utils.snackBar(context, message: state.errorMessage);
                      }
                    },
                    builder: (context, state) {
                      if (state is LogoutLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is LogoutFailureState) {
                        return AppWidget.typeButtonStartAction2(
                            context: context,
                            input: 'Logout',
                            onPressed: () {
                              BlocProvider.of<AuthenticationBloc>(context)
                                  .add(LogoutEvent());
                            },
                            bgColor: primary,
                            borderColor: primary,
                            textColor: grey1100);
                      } else if (state is LogoutSuccessState) {
                        return AppWidget.typeButtonStartAction2(
                            context: context,
                            input: 'Successfully Logged Out',
                            onPressed: () {},
                            bgColor: primary,
                            borderColor: primary,
                            textColor: grey1100);
                      } else {
                        return AppWidget.typeButtonStartAction2(
                            context: context,
                            input: 'Logout',
                            onPressed: () {
                              BlocProvider.of<AuthenticationBloc>(context)
                                  .add(LogoutEvent());
                            },
                            bgColor: primary,
                            borderColor: primary,
                            textColor: grey1100);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ItemPost(item: items[index]);
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 32),
                itemCount: items.length),
          )
        ],
      ),
    );
  }
}

/*

Column(
          children: [
            AnimationClick(
              child: Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(24)),
                child: Image.asset(
                  user,
                  width: 24,
                  height: 24,
                  color: grey1100,
                ),
              ),
            ),
            const SizedBox(height: 8),
            BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (state is LogoutSuccessState) {
                  Utils.snackBar(context, message: 'Logout Success');

                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, Routes.onBoarding1, (route) => false);
                  });
                } else if (state is LogoutFailureState) {
                  Utils.snackBar(context, message: state.errorMessage);
                }
              },
              builder: (context, state) {
                if (state is LogoutLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LogoutFailureState) {
                  return AppWidget.typeButtonStartAction2(
                      context: context,
                      input: 'Logout',
                      onPressed: () {
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(LogoutEvent());
                      },
                      bgColor: primary,
                      borderColor: primary,
                      textColor: grey1100);
                } else if (state is LogoutSuccessState) {
                  return AppWidget.typeButtonStartAction2(
                      context: context,
                      input: 'Successfully Logged Out',
                      onPressed: () {},
                      bgColor: primary,
                      borderColor: primary,
                      textColor: grey1100);
                } else {
                  return AppWidget.typeButtonStartAction2(
                      context: context,
                      input: 'Logout',
                      onPressed: () {
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(LogoutEvent());
                      },
                      bgColor: primary,
                      borderColor: primary,
                      textColor: grey1100);
                }
              },
            ),
          ],
        ),
*/
