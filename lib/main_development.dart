// Copyright (c) 2021, IndieApps
// https://indieapps.id/

import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:device_preview/device_preview.dart';

import 'app/myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  FlavorConfig(
    name: "DEVEL",
    color: Colors.red,
    location: BannerLocation.topStart,
    variables: {
      "baseUrl": "https://api.github.com",
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
        child: DevicePreview(
          enabled: false,
          builder: (context) => MyApp(),
        ),
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
