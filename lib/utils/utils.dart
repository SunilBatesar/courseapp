import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppUtils {
  // ------Flushbar--------
  // --------
  static flushbarBarMessage(String msg, BuildContext context) {
    Flushbar(
        flushbarPosition: FlushbarPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(154, 3, 3, 3),
        dismissDirection: FlushbarDismissDirection.VERTICAL,
        duration: const Duration(seconds: 4),
        margin: const EdgeInsets.fromLTRB(5, 2, 5, 0),
        borderRadius: BorderRadius.circular(20.r),
        messageText: Text(
          msg,
          style: const TextStyle(fontSize: 25, color: Colors.white),
        )).show(context);
  }

  // ------Focus Change --------
  // --------
  static focusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextfocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextfocus);
  }
}
