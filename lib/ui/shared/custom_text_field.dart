import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stacked_starter/constants/app_text.dart';
import 'package:flutter_stacked_starter/constants/color_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.title,
    required this.controller,
    this.obscureText = false,
    this.isSecondary = false,
    this.validator,
    this.hint,
    this.keyboardType = TextInputType.text,
    this.borderColor = AppColors.kcPrimaryColor,
    this.showHint = true,
    this.maxlines = 1,
    this.capitalization = TextCapitalization.none,
    this.enabled = true,
    this.showTitle = true,
    this.verticalSpacing =0,
    this.onSubmit,
    this.inputFormatters,
    this.instruction,
    this.validationText,
    this.required = false,
    this.fontSize,
    this.contentPadding,
    this.hintColor,
    this.onChange,
    this.fieldWidth
  });

  final String? hint;
  final String? instruction;
  final String? title;
  final Color? hintColor;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?, String?)? validator;
  final void Function(String? value)? onSubmit;
  final TextInputType keyboardType;
  final bool isSecondary;
  final bool showHint;
  final bool showTitle;
  final bool enabled;
  final Color borderColor;
  final int maxlines;
  final TextCapitalization capitalization;
  final List<TextInputFormatter>? inputFormatters;
  final bool required;
  final String? validationText;
  final void Function(String? value)? onChange;
  final double? fontSize;
  final EdgeInsets? contentPadding;
  final double? fieldWidth;
  final double verticalSpacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle)
          Wrap(
            children: [
              if (title != null)
                Text(
                  "$title ",
                  style: kManropeText.copyWith(
                    color: isSecondary
                        ? Colors.white
                        : const Color(0xFF222222).withOpacity(0.60),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              if (required)
                Text(
                  "*",
                  style: kManropeText.copyWith(
                    color: AppColors.kcPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                )
            ],
          ),
        verticalSpacing.verticalSpace,
        SizedBox(
          width: fieldWidth,
          child: TextFormField(
            onChanged: onChange,
            onFieldSubmitted: onSubmit?.call,
            inputFormatters: inputFormatters,
            enabled: enabled,
            maxLines: maxlines,
            textCapitalization: capitalization,
            style: kManropeText.copyWith(
              fontWeight: FontWeight.w500,
              color: enabled ? Colors.black : Colors.black38,
              fontSize: fontSize,
            ),
            keyboardType: keyboardType,
            decoration: InputDecoration(
              errorMaxLines: 3,
              contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              hintText: showHint ? hint : '',
              hintStyle: kManropeText.copyWith(
                color: hintColor ?? (isSecondary ? Colors.white : null),
                fontSize: kBodyMedium,
                fontWeight: FontWeight.w500,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor,
                  width: 2,
                ),
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor,
                  width: 2,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.kcPrimaryColor,
                  width: 2,
                ),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor,
                  width: 2,
                ),
              ),
              errorStyle: kManropeText.copyWith(
                color: isSecondary ? Colors.white : AppColors.kcPrimaryColor,
                fontWeight: FontWeight.w500,
              ),
              fillColor: isSecondary
                  ? Colors.white
                  : enabled
                      ? const Color(0xFFCCCCCC).withOpacity(0.28)
                      : const Color.fromARGB(255, 199, 199, 199),
              filled: true,
            ),
            controller: controller,
            obscureText: obscureText,
            validator: (value) => validator?.call(value, validationText ?? hint),
          ),
        ),
        if (instruction != null)
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Text(
                //   '* ',
                //   style: kManropeText.copyWith(
                //     color: Color(0xFF222222).withOpacity(0.60),
                //     fontSize: 14.sp,
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                Text(
                  instruction!,
                  style: kManropeText.copyWith(
                      color: const Color(0xFF222222).withOpacity(0.60),
                      fontSize: 12.sp),
                )
              ],
            ),
          )
      ],
    );
  }
}
