import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stacked_starter/enums/auth_button_type.dart';
import '../../../constants/app_text.dart';
import '../../../constants/color_constants.dart';
import 'app_loading.dart';
import 'ui_helpers.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.type,
    this.onTap,
    this.isBusy = false, this.width, this.height,
  });

  final AuthButtonType type;
  final VoidCallback? onTap;
  final bool isBusy;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final bool isGoogle = type == AuthButtonType.google;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 1,
        backgroundColor: isGoogle ? Colors.white : Colors.black,
        minimumSize: Size(width ?? double.infinity, height ?? 45.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onTap?.call,

      child: isBusy
          ? AppLoading(
              color: isGoogle ? AppColors.kcPrimaryColor : Colors.white)
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                horizontalSpaceRegular,
                Text(
                  'Continue with ${isGoogle ? 'Google' : 'Apple  '}',
                  style: kRobotoText.copyWith(
                      color: isGoogle ? Colors.black : Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
    );
  }
}
