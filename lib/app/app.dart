import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:base_mobile_indieapps/modules/splashscreen/view/splash_screen.dart';
import 'package:base_mobile_indieapps/services/di_service.dart';
import 'package:base_mobile_indieapps/services/navigation_service.dart';

import 'routes.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final ColorScheme _colorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFA80311),
    primaryVariant: Color(0xFF56423E),
    secondary: Color(0xFF006978),
    secondaryVariant: Color(0xFF009FAC),
    surface: Color(0xFFEFFDF8),
    background: Color(0xFFFFFFFF),
    error: Color(0xFFFF0000),
    onPrimary: Color(0xFFFAFAFA),
    onSecondary: Color(0xFFFAFAFA),
    onSurface: Color(0xFF000000),
    onBackground: Color(0xFF000000),
    onError: Color(0xFFFAFAFA),
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
      builder: () => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        builder: DevicePreview.appBuilder,
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
        home: const SplashScreen(),
      ),
    );
  }
}
