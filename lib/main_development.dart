// Copyright (c) 2021, IndieApps
// https://indieapps.id/

import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:device_preview/device_preview.dart';

import 'app/app.dart';
import 'app/app_bloc_observer.dart';

Future main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  FlavorConfig(
    name: "DEVEL",
    variables: {
      "baseUrl": "https://api.github.com",
      "username": "",
      "password": "",
    },
  );

  runZonedGuarded(
    () => runApp(
      EasyLocalization(
        startLocale: const Locale('en', 'US'),
        supportedLocales: const [Locale('en', 'US'), Locale('id', 'ID')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        child: DevicePreview(
          enabled: false,
          builder: (context) => const App(),
        ),
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
