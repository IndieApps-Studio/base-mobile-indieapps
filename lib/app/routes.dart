import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../modules/login/view/login_screen.dart';
import '../modules/main/view/main_widget.dart';

void configureRoutes() {
  final router = GetIt.I<FluroRouter>();

  router.notFoundHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return _RoutesNotFound();
    },
  );

  router.define(
    '/login',
    handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          LoginScreen(),
    ),
    transitionType: TransitionType.fadeIn,
  );

  router.define(
    '/main',
    handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          MainWidget(),
    ),
    transitionType: TransitionType.fadeIn,
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
          children: <Widget>[
            Text('Routes not found'),
          ],
        ),
      ),
    );
  }
}
