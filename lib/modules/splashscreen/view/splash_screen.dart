import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../services/navigation_service.dart';
import '../../../utils/customs/customs_box_shadow.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashBody();
  }
}

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  _navigateLogin() {
    GetIt.I<NavigationServiceMain>().pushNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/backgrounds/background_splash.png',
                fit: BoxFit.fill,
                width: 650.w,
              ),
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 340.w,
                    height: 580.h,
                    decoration: BoxDecoration(
                        color: Color(0x5FFFFFFF),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          CustomBoxShadow(
                            color: Colors.black12,
                            blurRadius: 25.0,
                            blurStyle: BlurStyle.outer,
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextButton(
                              onPressed: _navigateLogin,
                              child: Text(
                                'Masuk / Login',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 72.w),
                          child: RichText(
                            text: TextSpan(
                              text: '${tr('welcome')}\n',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Color(0xFF240115),
                              ),
                              children: [
                                TextSpan(text: tr('in')),
                                TextSpan(
                                  text: 'SMART CLASS',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 120.h),
                    child: Image.asset(
                      'assets/images/elearning.png',
                      width: 420.w,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
