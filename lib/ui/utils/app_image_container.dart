import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stacked_starter/constants/app_strings.dart';
import 'package:flutter_stacked_starter/constants/color_constants.dart';


class AppImageContainer extends StatelessWidget {
  final Color? color;
  final bool primaryColor;
  final double? width;
  final double? height;
  const AppImageContainer(
      {super.key,
      this.color,
      this.primaryColor = true,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      defaultAssetImage,
      color: color ??
          (primaryColor ? (AppColors.kcPrimaryColor) : const Color(0xFF474747)),
      fit: BoxFit.contain,
      height: width ?? 38.w,
      width: height ?? 160.w,
    );
  }
}
