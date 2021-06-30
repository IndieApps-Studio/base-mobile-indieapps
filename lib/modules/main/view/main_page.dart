import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_state_widget.dart';
import '../cubit/counter_cubit.dart';
import '../cubit/profile_cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFFFFF),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProfileCubit(),
          ),
          BlocProvider(
            create: (context) => CounterCubit(),
          )
        ],
        child: _MainWidget(),
      ),
    );
  }
}

class _MainExample extends StatelessWidget {
  const _MainExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}

class _MainWidget extends StatelessWidget {
  const _MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomStateWidget<ProfileSuccess, ProfileLoading, ProfileFailed>(
      state: context.watch<ProfileCubit>().state,
      onError: () {
        context.read<ProfileCubit>().initial();
      },
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Main'),
              Text('${state.user.id}'),
              Text(state.user.name),
              Text(state.user.htmlUrl),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().decrease();
                    },
                    child: Text('Decrease'),
                  ),
                  const SizedBox(width: 8),
                  BlocBuilder<CounterCubit, int>(
                    builder: (context, state) {
                      return Text(
                        '$state',
                        style: TextStyle(fontSize: 68.sp),
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().increase();
                    },
                    child: Text('Increase'),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
