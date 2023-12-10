import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/features/feed/presentation/bloc/feed_bloc.dart';
import 'package:flutter_ultimate/features/profiles/presentation/bloc/profile_bloc.dart';
import 'package:flutter_ultimate/profile_injection.dart' as injection;
import 'package:http/http.dart' as http;
import 'package:responsive_framework/responsive_framework.dart';

import '../common/bloc/account_information/account_info_user_b/account_information_bloc_b.dart';
import '../common/bloc/account_information/account_information_bloc.dart';
import '../common/bloc/auth/authentication_bloc.dart';
import '../common/bloc/auth/b/authentication_bloc_b.dart';
import '../common/bloc/auth_social/auth_social_bloc.dart';
import '../common/bloc/otp/otp_bloc.dart';
import '../common/bloc/slider/bloc_slider.dart';
import '../common/bloc/store_user_interests/store_user_interests_bloc.dart';
import '../common/bloc/upload_image/upload_images_b/upload_images_bloc.dart';
import '../common/bloc/upload_image/upload_images_bloc.dart';
import '../common/constant/dark_mode.dart';
import '../common/route/route_generator.dart';
import '../common/route/routes.dart';
import '../data/datasources/Auth/auth_remote_data_source.dart';
import '../data/repositories/auth/auth_repo.dart';
import '../dependency_indjection.dart';
import '../sharedPreferences.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey(debugLabel: 'Main Navigator');

/// This file contains the definition of the [MyApp] class, which is the main entry point of the application.
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final prefManager = sl<PrefManager>();
  // String? token = prefManager.token;

  // @override
  // void initState() {
  //   prefManager.testToken = '';
  //   //prefManager.lastViewedPage ??= Routes.onBoarding1;
  //   prefManager.logout();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // prefManager.logout();

    bool _isLoggedIn = prefManager.token != 'token' &&
        prefManager.token != null &&
        prefManager.token!.isNotEmpty;

    print('Is the User Logged in?: $_isLoggedIn');

    return MultiBlocProvider(
      providers: [
        // Slider Bloc
        BlocProvider<SliderBloc>(
          create: (BuildContext context) => SliderBloc(),
        ),
        // Authentication Bloc
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => AuthenticationBloc(
            authenticationRepository: AuthenticationRepository(
              remoteDataSource: AuthenticationRemoteDataSourceImpl(
                client: http.Client(),
              ),
            ),
          ),
        ),
        // Authentication Bloc B
        BlocProvider<AuthenticationBlocB>(
          create: (BuildContext context) => AuthenticationBlocB(
            authenticationRepository: AuthenticationRepository(
              remoteDataSource: AuthenticationRemoteDataSourceImpl(
                client: http.Client(),
              ),
            ),
          ),
        ),
        // OTP Bloc
        BlocProvider<OtpBloc>(
          create: (BuildContext context) => OtpBloc(
            authRepository: AuthenticationRepository(
                remoteDataSource:
                    AuthenticationRemoteDataSourceImpl(client: http.Client())),
          ),
        ),
        // Auth Social Bloc
        BlocProvider<AuthSocialBloc>(
          create: (BuildContext context) => AuthSocialBloc(
            authenticationRepository: AuthenticationRepository(
                remoteDataSource:
                    AuthenticationRemoteDataSourceImpl(client: http.Client())),
          ),
        ),
        // Upload Images Bloc
        BlocProvider<UploadImagesBloc>(
          create: (BuildContext context) => UploadImagesBloc(
            authenticationRepository: AuthenticationRepository(
                remoteDataSource:
                    AuthenticationRemoteDataSourceImpl(client: http.Client())),
          ),
        ),
        // User B Upload Images Bloc
        BlocProvider<UserBUploadImagesBloc>(
          create: (BuildContext context) => UserBUploadImagesBloc(
            authenticationRepository: AuthenticationRepository(
                remoteDataSource:
                    AuthenticationRemoteDataSourceImpl(client: http.Client())),
          ),
        ),
        // User B Account Info Bloc
        BlocProvider<UserBAccountInfoBloc>(
          create: (BuildContext context) => UserBAccountInfoBloc(
            authenticationRepository: AuthenticationRepository(
                remoteDataSource:
                    AuthenticationRemoteDataSourceImpl(client: http.Client())),
          ),
        ),
        // Account Info Bloc
        BlocProvider<AccountInfoBloc>(
          create: (BuildContext context) => AccountInfoBloc(
            authenticationRepository: AuthenticationRepository(
                remoteDataSource:
                    AuthenticationRemoteDataSourceImpl(client: http.Client())),
          ),
        ),
        // Store User Interests Bloc
        BlocProvider<StoreUserInterestsBloc>(
          create: (BuildContext context) => StoreUserInterestsBloc(
            authenticationRepository: AuthenticationRepository(
                remoteDataSource:
                    AuthenticationRemoteDataSourceImpl(client: http.Client())),
          ),
        ),
        BlocProvider(
          create: (BuildContext context) => injection.sl<ProfileBloc>(),
        ),
        BlocProvider(
          create: (BuildContext context) => injection.sl<FeedBloc>(),
        ),
      ],
      child: MaterialApp(
        // initialRoute: prefManager.lastViewedPage ??
        //     (_isLoggedIn ? Routes.accountInformation : Routes.onBoarding1),

        // initialRoute: Routes.profilesLanding,

        initialRoute: _isLoggedIn
            ? prefManager.userType == 'User A'
                ? Routes.feedPage
                : Routes.feedPage
            : Routes.onBoarding1,
        // initialRoute: Routes.newUploadImages,

        navigatorKey: navigatorKey,
        onGenerateRoute: RouteGenerator.generateRoute,
        title: 'Ultimate',
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        builder: (context, child) => ResponsiveWrapper.builder(child,
            maxWidth: 1200,
            minWidth: 480,
            defaultScale: true,
            breakpoints: const [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(2460, name: '4K'),
            ],
            background: Container(color: const Color(0xFFF5F5F5))),
        // home: const OnBoardingOne(),
      ),
    );
  }
}
