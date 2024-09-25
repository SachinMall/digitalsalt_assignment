import 'package:digitalsalt_assignment/res/app_colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColor.lightpurple,
      textColor: AppColor.kblack,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
      
    );
  }

  static toastMessageCenter(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColor.kblack,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG,
      textColor: AppColor.kwhite,
    );
  }

  static snackBar(String title, String message) {
    Get.snackbar(title, message, backgroundColor: AppColor.lightpurple);
  }

  static String metersToKilometers(double meters) {
    double kilometers = meters % 1000;
    return kilometers.toStringAsFixed(2); // Limiting to 2 decimal places
  }
}