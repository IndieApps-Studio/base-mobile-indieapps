import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'custom_error_widget.dart';
import 'custom_loading_widget.dart';

class CustomStateWidget<SUCCESS, LOADING, FAILED> extends StatelessWidget {
  const CustomStateWidget(
      {Key? key,
      required this.onError,
      required this.state,
      required this.builder})
      : super(key: key);

  final Function onError;
  final Object state;

  ///onSuccess State Widget Appear
  final Widget Function(BuildContext context, SUCCESS state) builder;

  @override
  Widget build(BuildContext context) {
    if (state is LOADING) {
      return Center(child: CustomLoadingWidget());
    } else if (state is FAILED) {
      return CustomErrorWidget(onTap: onError);
    } else if (state is SUCCESS) {
      return builder(context, state as SUCCESS);
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.error,
            size: 32,
            color: Color(0xFFDB5A5A),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            tr('errors.state', args: [state.toString()]),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFDB5A5A),
            ),
          )
        ],
      ),
    );
  }
}
