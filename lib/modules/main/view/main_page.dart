import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/custom_state_widget.dart';
import '../cubit/profile_cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFFFFF),
      body: BlocProvider(
        create: (context) => ProfileCubit(),
        child: _MainWidget(),
      ),
    );
  }
}

class _MainWidget extends StatelessWidget {
  const _MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileState = context.watch<ProfileCubit>().state;
   
    return CustomStateWidget<ProfileSuccess, ProfileLoading, ProfileFailed>(
      state: profileState,
      onError: () {
        context.read<ProfileCubit>().initial();
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Main'),
          ],
        ),
      ),
    );
  }
}
