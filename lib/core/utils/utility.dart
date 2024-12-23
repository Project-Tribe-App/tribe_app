// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toastification/toastification.dart';

// Project imports:
import 'package:project_tribe/core/tribe_color.dart';

abstract class Utility {
  static void showLoadingDialog(
    BuildContext context, {
    Color loaderColor = Colors.blue,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return Builder(
          builder: (innerContext) {
            return SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.1,
                    child: ModalBarrier(
                      dismissible: false,
                      color: loaderColor,
                    ),
                  ),
                  Center(
                    child: Shimmer.fromColors(
                      baseColor: TribeColor.primaryColor.withOpacity(0.1), // ignore: deprecated_member_use
                      highlightColor: Colors.white.withOpacity(0.6), // ignore: deprecated_member_use
                      period: const Duration(milliseconds: 500),
                      child: Container(
                        height: 1.sh,
                        width: 1.sw,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  static void closeDialog() {
    log('HIDE LOADER');
    try {
      Get.back();
    } catch (e) {
      log(e.toString());
    }
  }

  static void showToast({
    required BuildContext context,
    required String title,
    required ToastificationType type,
    String? description,
  }) {
    toastification.show(
      context: context,
      type: type,
      style: ToastificationStyle.flat,
      title: Text(title),
      description: description != null
          ? Text(
              description,
              maxLines: 3,
            )
          : null,
      alignment: Alignment.bottomLeft,
      autoCloseDuration: const Duration(seconds: 4),
      animationBuilder: (
        context,
        animation,
        alignment,
        child,
      ) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
    );
  }

  static void showSuccessToast({
    required String title,
    required BuildContext context,
    String? description,
  }) {
    showToast(
      title: title,
      description: description,
      type: ToastificationType.success,
      context: context,
    );
  }

  static void showInfoToast({
    required BuildContext context,
    required String title,
    String? description,
  }) {
    showToast(
      title: title,
      description: description,
      type: ToastificationType.info,
      context: context,
    );
  }

  static void showWarningToast({
    required BuildContext context,
    required String title,
    String? description,
  }) {
    showToast(
      title: title,
      description: description,
      type: ToastificationType.warning,
      context: context,
    );
  }

  static void showErrorToast({
    required BuildContext context,
    required String title,
    String? description,
  }) {
    showToast(
      title: title,
      description: description,
      type: ToastificationType.error,
      context: context,
    );
  }

  static String convertToAMPM(DateTime dateTime) {
    String trailing = 'AM';
    String time = '';
    int hour = dateTime.hour;
    final minute = dateTime.minute;
    if (hour > 12) {
      hour = hour - 12;
      trailing = 'PM';
    }
    if (hour == 12) {
      trailing = 'PM';
    }
    if (hour == 00) {
      hour = 12;
    }

    if (hour < 10 && minute < 10) {
      time = '0$hour:0$minute $trailing';
    } else if (hour < 10) {
      time = '0$hour:$minute $trailing';
    } else if (minute < 10) {
      time = '$hour:0$minute $trailing';
    } else {
      time = '$hour:$minute $trailing';
    }
    return time;
  }
}
