import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../services/navigation_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  onPressedLogin() {
    GetIt.I<NavigationServiceMain>().pushReplacementNamed('/main');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login Screen'),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: onPressedLogin,
              child: Text(
                tr('login'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
