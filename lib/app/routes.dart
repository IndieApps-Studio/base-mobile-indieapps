import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:base_mobile_indieapps/modules/login/view/login_screen.dart';
import 'package:base_mobile_indieapps/modules/main/view/main_page.dart';

void configureRoutes() {
  final router = GetIt.I<FluroRouter>();

  router.notFoundHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const _RoutesNotFound();
    },
  );

  router.define(
    '/login',
    handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          const LoginScreen(),
    ),
    transitionType: TransitionType.cupertino,
  );

  router.define(
    '/main',
    handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          const MainPage(),
    ),
    transitionType: TransitionType.cupertino,
  );
}

class _RoutesNotFound extends StatelessWidget {
  const _RoutesNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Routes not found'),
          ],
        ),
      ),
    );
  }
}
