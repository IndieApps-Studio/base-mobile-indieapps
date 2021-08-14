import 'package:base_mobile_indieapps/repositories/main_repository.dart';
import 'package:base_mobile_indieapps/widgets/custom_loading_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'package:base_mobile_indieapps/services/navigation_service.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  void Function()? _navigateLogin() {
    GetIt.I<NavigationServiceMain>().pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _SplashScreenCubit(),
      child: Builder(builder: (context) {
        return BlocListener<_SplashScreenCubit, bool>(
          listener: (context, state) {
            if (state) {
              _navigateLogin();
            }
          },
          child: const _SplashBody(),
        );
      }),
    );
  }
}

class _SplashBody extends StatelessWidget {
  const _SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 525.w,
              ),
              SizedBox(height: 16.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '${tr('welcome')}\n',
                  style: TextStyle(
                    fontSize: 32.sp,
                    color: const Color(0xFF240115),
                  ),
                  children: const [
                     TextSpan(
                      text: 'Base Mobile',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const CustomLoadingWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SplashScreenCubit extends Cubit<bool> {
  _SplashScreenCubit() : super(false) {
    _init();
  }
  final _repo = MainRepository();

  Future _init() async {
    await _repo.setup();
    Future.delayed(const Duration(seconds: 1)).then((value) => emit(true));
  }
}
