import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

import '../../../helper/route_observer.dart';
import '../../../services/navigation_service.dart';

class MainWidget extends HookWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final keyRoute =
        useMemoized(() => GetIt.I<NavigationServiceHome>().navigatorKey);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFFFFF),
      body: Navigator(
        observers: [SmartClassRouteObserver()],
        key: keyRoute,
        onGenerateRoute: GetIt.I<FluroRouter>().generator,
        initialRoute: '/home',
      ),
    );
  }
}
