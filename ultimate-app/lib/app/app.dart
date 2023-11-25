import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/common/bloc/account_information/account_info_user_b/account_information_bloc_b.dart';
import 'package:flutter_ultimate/common/bloc/account_information/account_information_bloc.dart';
import 'package:flutter_ultimate/common/bloc/auth/b/authentication_bloc_b.dart';
import 'package:flutter_ultimate/common/bloc/upload_image/upload_images_b/upload_images_bloc.dart';
import 'package:flutter_ultimate/common/bloc/upload_image/upload_images_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_framework/responsive_framework.dart';

import '../common/bloc/auth/authentication_bloc.dart';
import '../common/bloc/auth_social/auth_social_bloc.dart';
import '../common/bloc/otp/otp_bloc.dart';
import '../common/bloc/slider/bloc_slider.dart';
import '../common/constant/dark_mode.dart';
import '../common/route/route_generator.dart';
import '../common/route/routes.dart';
import '../data/datasources/Auth/auth_remote_data_source.dart';
import '../data/repositories/auth/auth_repo.dart';
import '../dependency_indjection.dart';
import '../sharedPreferences.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey(debugLabel: 'Main Navigator');

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final prefManager = sl<PrefManager>();
  // String? token = prefManager.token;

  @override
  void initState() {
    prefManager.testToken = '';
    //prefManager.lastViewedPage ??= Routes.onBoarding1;
    super.initState();
    // prefManager.logout();
  }

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
        BlocProvider<SliderBloc>(
          create: (BuildContext context) => SliderBloc(),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => AuthenticationBloc(
            authenticationRepository: AuthenticationRepository(
              remoteDataSource: AuthenticationRemoteDataSourceImpl(
                client: http.Client(),
              ),
            ),
          ),
        ),
        BlocProvider<AuthenticationBlocB>(
          create: (BuildContext context) => AuthenticationBlocB(
            authenticationRepository: AuthenticationRepository(
              remoteDataSource: AuthenticationRemoteDataSourceImpl(
                client: http.Client(),
              ),
            ),
          ),
        ),
        BlocProvider<OtpBloc>(
          create: (BuildContext context) => OtpBloc(
            authRepository: AuthenticationRepository(
                remoteDataSource:
                    AuthenticationRemoteDataSourceImpl(client: http.Client())),
          ),
        ),
        BlocProvider<AuthSocialBloc>(
          create: (BuildContext context) => AuthSocialBloc(
            authenticationRepository: AuthenticationRepository(
                remoteDataSource:
                    AuthenticationRemoteDataSourceImpl(client: http.Client())),
          ),
        ),
        BlocProvider<UploadImagesBloc>(
          create: (BuildContext context) => UploadImagesBloc(
            authenticationRepository: AuthenticationRepository(
                remoteDataSource:
                    AuthenticationRemoteDataSourceImpl(client: http.Client())),
          ),
        ),
        BlocProvider<UserBUploadImagesBloc>(
          create: (BuildContext context) => UserBUploadImagesBloc(
            authenticationRepository: AuthenticationRepository(
                remoteDataSource:
                    AuthenticationRemoteDataSourceImpl(client: http.Client())),
          ),
        ),
        BlocProvider<UserBAccountInfoBloc>(
          create: (BuildContext context) => UserBAccountInfoBloc(
            authenticationRepository: AuthenticationRepository(
                remoteDataSource:
                    AuthenticationRemoteDataSourceImpl(client: http.Client())),
          ),
        ),
        BlocProvider<AccountInfoBloc>(
          create: (BuildContext context) => AccountInfoBloc(
            authenticationRepository: AuthenticationRepository(
                remoteDataSource:
                    AuthenticationRemoteDataSourceImpl(client: http.Client())),
          ),
        ),
      ],
      child: MaterialApp(
        // initialRoute: prefManager.lastViewedPage ??
        //     (_isLoggedIn ? Routes.accountInformation : Routes.onBoarding1),

        initialRoute: _isLoggedIn
            ? prefManager.lastViewedPage ?? Routes.accountInformation
            : prefManager.lastViewedPage ?? Routes.onBoarding1,

        // initialRoute: Routes.uploadImages,
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
