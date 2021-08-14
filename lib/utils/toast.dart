import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'extensions.dart';

void showToastError(String message) {
  Fluttertoast.showToast(
    msg: message.capitalize,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 14.0,
  );
}

void showToastSuccess(String message) {
  Fluttertoast.showToast(
    msg: message.capitalize,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: const Color(0xFF266ED1),
    textColor: Colors.white,
    fontSize: 14.0,
  );
}
