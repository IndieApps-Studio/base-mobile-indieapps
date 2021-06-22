import 'package:flutter/material.dart';

import 'custom_error_widget.dart';
import 'custom_loading_widget.dart';

class CustomStateWidget<SUCCESS, LOADING, FAILED> extends StatelessWidget {
  const CustomStateWidget(
      {Key? key,
      required this.onError,
      required this.state,
      required this.child})
      : super(key: key);

  final Function onError;
  final Object state;

  ///onSuccess State Widget Appear
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (state is LOADING) {
      return Center(child: CustomLoadingWidget());
    } else if (state is FAILED) {
      return CustomErrorWidget(onTap: onError);
    } else if (state is FAILED) {
      return child;
    }

    return CustomLoadingWidget();
  }
}
