import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import 'app/myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  FlavorConfig(
    name: "DEVEL",
    color: Colors.red,
    location: BannerLocation.topStart,
    variables: {
      "baseUrl": "http://10.0.0.184:8000",
      "username": "",
      "password": "",
    },
  );

  runZonedGuarded(
    () => runApp(
      EasyLocalization(
        startLocale: Locale('en', 'US'),
        saveLocale: true,
        supportedLocales: [Locale('en', 'US'), Locale('id', 'ID')],
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
        child: MyApp(),
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
