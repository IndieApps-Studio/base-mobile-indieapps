import 'package:easy_localization/easy_localization.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../modules/splashscreen/view/splash_screen.dart';
import '../services/di_service.dart';
import '../services/navigation_service.dart';
import 'routes.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ColorScheme _colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: const Color(0xFFA80311),
    primaryVariant: const Color(0xFF56423E),
    secondary: const Color(0xFF006978),
    secondaryVariant: const Color(0xFF009FAC),
    surface: const Color(0xFFEFFDF8),
    background: const Color(0xFFFFFFFF),
    error: const Color(0xFFFF0000),
    onPrimary: const Color(0xFFFAFAFA),
    onSecondary: const Color(0xFFFAFAFA),
    onSurface: const Color(0xFF000000),
    onBackground: const Color(0xFF000000),
    onError: const Color(0xFFFAFAFA),
  );

  @override
  void initState() {
    super.initState();
    Hive.initFlutter();
    DIService.initialize();
    configureRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1280, 820),
      builder: () => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        navigatorKey: GetIt.I<NavigationServiceMain>().navigatorKey,
        onGenerateRoute: GetIt.I<FluroRouter>().generator,
        theme: ThemeData(
          colorScheme: _colorScheme,
          primaryColor: _colorScheme.primary,
          accentColor: _colorScheme.secondary,
          backgroundColor: _colorScheme.background,
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          fontFamily: 'Roboto',
        ),
        home: SplashScreen(),
      ),
    );
  }
}
