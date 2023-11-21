import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/common/bloc/auth/authentication_bloc.dart';
import 'package:flutter_ultimate/common/bloc/auth_social/auth_social_bloc.dart';
import 'package:flutter_ultimate/common/bloc/otp/otp_bloc.dart';
import 'package:flutter_ultimate/data/datasources/Auth/auth_remote_data_source.dart';
import 'package:flutter_ultimate/data/repositories/auth/auth_repo.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_framework/responsive_framework.dart';

import '../common/bloc/slider/bloc_slider.dart';
import '../common/constant/dark_mode.dart';
import '../common/route/route_generator.dart';
import '../common/route/routes.dart';
import 'menu.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey(debugLabel: 'Main Navigator');

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
      ],
      child: MaterialApp(
        initialRoute: Routes.onBoarding1,
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
        home: const AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          child: MenuNavigation(),
        ),
      ),
    );
  }
}
