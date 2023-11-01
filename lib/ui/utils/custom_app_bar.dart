import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stacked_starter/constants/app_text.dart';
import 'package:flutter_stacked_starter/constants/color_constants.dart';
import 'package:flutter_stacked_starter/ui/utils/app_image_container.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, 
    this.title = '',
    this.onBackPress,
    this.centerTitle = true,
    this.tabs,
    this.actions,
    this.bgColor = Colors.white,
    this.showLeading = false,
    this.addLogo = false,
    this.logoColor = Colors.white,
    this.titleColor = Colors.black,
    this.addBorder = false, this.height,
  });

  final String title;
  final bool centerTitle;
  final bool showLeading;
  final bool addBorder;
  final bool addLogo;
  final Color bgColor;
  final VoidCallback? onBackPress;
  final List<String>? tabs;
  final List<Widget>? actions;
  final Color logoColor;
  final Color titleColor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: addBorder
          ? const Border(
              bottom: BorderSide(color: Color(0x1F2E2E2E)),
            )
          : null,
      elevation: 0,
      backgroundColor: bgColor,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      toolbarHeight: 80.h,
      title: addLogo
          ? AppImageContainer(color: logoColor)
          : Text(
              title,
              style: kManropeText.copyWith(
                fontSize: kHeadingOne,
                color: titleColor,
                fontWeight: kFwMedium,
              ),
            ),
      leading: showLeading
          ? Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: InkWell(
                onTap: onBackPress,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: bgColor == Colors.white ? const Color.fromRGBO(91, 91, 91, 1) : Colors.white,
                  size: 35.w,

                ),
              ),
          )
          : null,
      actions: actions,
      bottom: tabs != null
          ? TabBar(
              indicatorColor: AppColors.kcPrimaryColor,
              tabs: tabs!
                  .map<Widget>(
                    (String tab) => Tab(
                      child: Text(
                        tab,
                        style: kManropeText.copyWith(
                          color: Colors.black54,
                          fontSize: kBodyLarge,
                          fontWeight: kFwBold,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? (tabs != null ? 100.h : 80.h));
}
