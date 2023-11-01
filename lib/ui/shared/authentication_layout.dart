import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stacked_starter/constants/color_constants.dart';
import 'package:flutter_stacked_starter/enums/auth_button_type.dart';
import 'package:flutter_stacked_starter/enums/authentication_layout_type.dart';

import '../../../constants/app_text.dart';
import 'auth_button.dart';
import 'busy_button.dart';
import 'ui_helpers.dart';

class AuthenticationLayout extends StatelessWidget {
  const AuthenticationLayout({
    super.key,
    required this.form,
    required this.onMainButtonTap,
    required this.layoutType,
    required this.onRedirectTap,
    required this.isBusy,
    this.showLogo = false,
    required this.onGoogleLogin,
    required this.onAppleLogin,
    required this.googleBusy,
    required this.appleBusy,
    required this.onTapKinde,
    required this.kindeBusy,
    this.onTapSignup,
  });

  final Widget form;
  final bool isBusy;
  final bool showLogo;
  final bool googleBusy;
  final bool appleBusy;
  final bool kindeBusy;

  final AuthenticationLayoutType layoutType;
  final VoidCallback onMainButtonTap;
  final VoidCallback onRedirectTap;
  final void Function(String userPage) onGoogleLogin;
  final void Function(String userPage) onAppleLogin;
  final void Function(String userPage) onTapKinde;
  final void Function()? onTapSignup;

  @override
  Widget build(BuildContext context) {
    final bool isRegisterLayout =
        layoutType == AuthenticationLayoutType.register;

    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 0.h,
          ),
          children: [
            form,
            30.verticalSpace,
            BusyButton(
              width: double.infinity,
              fontSize: kBodyMedium,
              onPressed: onMainButtonTap,
              busy: isBusy,
              title: isRegisterLayout ? 'Create Account' : 'Sign In',
              textStyle: kManropeText.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              borderRadius: 8,
              busyColor: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenWidthPercentage(context, percentage: 0.33),
                    child: const Divider(thickness: 1, color: Colors.black),
                  ),
                  const Text(
                    'or',
                    style: TextStyle(
                        // color: Colors.white
                        ),
                  ),
                  SizedBox(
                    width: screenWidthPercentage(context, percentage: 0.33),
                    child: const Divider(thickness: 1, color: Colors.black),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                AuthButton(
                  type: AuthButtonType.google,
                  onTap: () =>
                      onGoogleLogin(isRegisterLayout ? 'SignUp' : 'Login'),
                  isBusy: googleBusy,
                ),
                if (Platform.isIOS)
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: AuthButton(
                      type: AuthButtonType.apple,
                      onTap: () =>
                          onAppleLogin(isRegisterLayout ? 'SignUp' : 'Login'),
                      isBusy: appleBusy,
                    ),
                  ),
                verticalSpaceRegular,
                GestureDetector(
                  onTap: () =>
                      onTapKinde(isRegisterLayout ? 'SignUp' : 'Login'),
                  child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: 50.h,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.black.withOpacity(0.05)),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [BoxShadow(color: Colors.black12)],
                        color: Colors.white,
                      ),
                      child: kindeBusy
                          ? const CircularProgressIndicator(
                              color: AppColors.kcPrimaryColor,
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10.r),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  child: Image.asset('assets/images/logo.jpeg',),
                                ),
                                Text(
                                  "Continue With Kinde",
                                  style: kRobotoText.copyWith(
                                    fontSize: 18,
                                    fontWeight: kFwRegular,
                                  ),
                                ),
                              ],
                            )),
                ),
                verticalSpaceMedium,
                if (onTapSignup != null)
                  GestureDetector(
                      onTap: onTapSignup,
                      child: Text(
                        "Dont Have An Account? Signup",
                        style: kManropeText.copyWith(fontWeight: kFwMedium),
                      ))
              ],
            ),
            _buildVerticalSpace(isRegisterLayout),
          ],
        ),
      ],
    );
  }

  Widget _buildVerticalSpace(bool isRegister) {
    return (isRegister
            ? 44
            : Platform.isIOS
                ? 120
                : 180)
        .verticalSpace;
  }
}
