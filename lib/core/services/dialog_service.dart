import 'package:doctor_mobile/core/constants/asset_const.dart';
import 'package:doctor_mobile/core/widget/dialog_content_general_widget.dart';
import 'package:doctor_mobile/core/widget/dialog_content_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogService {
  static bool showLoading({
    bool barrierDismissible = false,
  }) {
    Get.dialog(
      DialogContentLoadingWidget(
        barrierDismissible: barrierDismissible,
      ),
      barrierDismissible: barrierDismissible,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.3),
    );

    return true;
  }

  static bool closeLoading() {
    Get.back();
    return false;
  }

  static Future<T?> showDialogGeneral<T>({
    double margin = 40,
    double radius = 14,
    Color? color,
    Widget? content,
    bool barrierDismissible = true,
    EdgeInsetsGeometry padding = const EdgeInsets.all(16),
    ScrollPhysics? physics,
  }) async {
    return await Get.dialog<T>(
      WillPopScope(
        onWillPop: () => Future.value(barrierDismissible),
        child: Center(
          child: SingleChildScrollView(
            physics: physics,
            child: Material(
              color: Colors.transparent,
              child: Container(
                margin: EdgeInsets.all(margin),
                padding: padding,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(radius.r),
                ),
                child: content ?? const SizedBox(),
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<T?> showDialogProblem<T>({
    VoidCallback? buttonOnTap,
    String description = 'Terjadi Kesalahan, Silahkan Coba Lagi',
    String title = 'Upss Ada Masalah',
    String textButton = 'Tutup',
    bool barrierDismissible = true,
  }) async {
    return await showDialogGeneral<T>(
      barrierDismissible: barrierDismissible,
      content: DialogContentGeneralWidget.oneButton(
        barrierDismissible: barrierDismissible,
        onTapPositiveButton: buttonOnTap ??
            () {
              Get.back();
            },
        description: description,
        title: title,
        textPositiveButton: textButton,
        imagePath: AssetConst.drawDialogError,
      ),
    );
  }

  static Future<T?> showDialogSuccess<T>({
    VoidCallback? buttonOnTap,
    String description = '',
    String title = 'Berhasil',
    String textButton = 'Tutup',
    bool barrierDismissible = true,
    Color? descColor,
  }) async {
    return await showDialogGeneral<T>(
      barrierDismissible: barrierDismissible,
      content: DialogContentGeneralWidget.oneButton(
        barrierDismissible: barrierDismissible,
        descColors: descColor,
        onTapPositiveButton: buttonOnTap ??
            () {
              Get.back();
            },
        description: description,
        title: title,
        textPositiveButton: textButton,
        imagePath: AssetConst.drawDialogSuccess,
      ),
    );
  }

  static Future<T?> showDialogChoice<T>({
    final VoidCallback? onTapPositiveButton,
    final VoidCallback? onTapNegativeButton,
    required final String description,
    final String title = '',
    final String textPositiveButton = 'Oke',
    final String textNegativeButton = 'Tutup',
    final String imagePath = AssetConst.drawDialogQuestion,
    bool barrierDismissible = true,
    bool isHorizontal = true,
    Color? descColor,
  }) async {
    return await showDialogGeneral<T>(
      barrierDismissible: barrierDismissible,
      content: DialogContentGeneralWidget.twoButton(
        barrierDismissible: barrierDismissible,
        imagePath: imagePath,
        textPositiveButton: textPositiveButton,
        textNegativeButton: textNegativeButton,
        description: description,
        title: title,
        onTapPositiveButton: onTapPositiveButton,
        onTapNegativeButton: onTapNegativeButton,
        isHorizontal: isHorizontal,
        descColors: descColor,
      ),
    );
  }
}
