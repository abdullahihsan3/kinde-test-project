import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stacked_starter/constants/app_strings.dart';
import 'package:flutter_stacked_starter/constants/app_text.dart';
import 'package:flutter_stacked_starter/constants/color_constants.dart';
import 'package:flutter_stacked_starter/ui/photos/photos_viewmodel.dart';
import 'package:flutter_stacked_starter/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class PhotosView extends StackedView<PhotosViewModel> {
  const PhotosView({super.key});

  @override
  void onViewModelReady(PhotosViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.init();
  }

  @override
  Widget builder(
      BuildContext context, PhotosViewModel viewModel, Widget? child) {
    return Scaffold(
        appBar: AppBar(
          title:  Text(
            'Random Photo',
            style: kManropeText.copyWith(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          actions: [
            GestureDetector(
                onTap: () => viewModel.logout(),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                ))
          ],
          leading: GestureDetector(
              onTap: () => viewModel.back(),
              child: const Icon(Icons.arrow_back_ios)),
        ),
        body: viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () => viewModel.init(),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        verticalSpaceMedium,
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: ElevatedButton.icon(
                                onPressed: () {
                                  viewModel.navigateToProfileDetails();
                                },
                                icon: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  "Profile Details",
                                  style: kManropeText,
                                )),
                          ),
                        ),
                        verticalSpaceMedium,
                        CustomElevatedButton(
                          onPressed: () {
                            viewModel.getFlagInfo();
                          },
                          child: const Text("Get Flag Info",style: TextStyle(color: Colors.white),),
                        ),
                        CustomElevatedButton(
                          onPressed: () {
                            viewModel.getUserActivity();
                          },
                          child: const Text("Get User Activity",style: TextStyle(color: Colors.white)),
                        ),
                        CustomElevatedButton(
                            onPressed: () {
                              viewModel.getScopes();
                            },
                            child: const Text("Get Scopes",style: TextStyle(color: Colors.white))),
                        CustomElevatedButton(
                            onPressed: () {
                              viewModel.getClaim();
                            },
                            child: const Text("Get Claims",style: TextStyle(color: Colors.white))),
                        CustomElevatedButton(
                            onPressed: () {
                              viewModel.createOrg();
                            },
                            child: const Text("Create Org",style: TextStyle(color: Colors.white))),
                        CustomElevatedButton(
                            onPressed: () {
                              viewModel.isAuthenticated();
                            },
                            child: const Text("Is Authenticated",style: TextStyle(color: Colors.white))),
                        CustomElevatedButton(
                            onPressed: () {
                              viewModel.getUserDetails();
                            },
                            child: const Text("Get User Details",style: TextStyle(color: Colors.white))),
                        CustomElevatedButton(
                            onPressed: () {
                              viewModel.getPermissions();
                            },
                            child: const Text("Get Permissions",style: TextStyle(color: Colors.white))),
                        CustomElevatedButton(
                            onPressed: () {
                              viewModel.getUserProfileV2();
                            },
                            child: const Text("Get User Profile",style: TextStyle(color: Colors.white))),
                        CustomElevatedButton(
                            onPressed: () {
                              viewModel.getClaimOrganization();
                            },
                            child: const Text("Get Claim Organization",style: TextStyle(color: Colors.white))),
                        CustomElevatedButton(
                            onPressed: () {
                              viewModel.getOrganizations();
                            },
                            child: const Text("Get Organizations",style: TextStyle(color: Colors.white))),
                        CustomElevatedButton(
                            onPressed: () {
                              viewModel.getFeatureFlags();
                            },
                            child: const Text("Get Feature Flags",style: TextStyle(color: Colors.white))),
                        CustomElevatedButton(
                          onPressed: () async {
                            debugPrint(await viewModel.returnAccessToken());
                          },
                          child: const Text("get Token",style: TextStyle(color: Colors.white)),
                        ),
                        CustomElevatedButton(
                            onPressed: () {
                              viewModel.getBISFlag();
                            },
                            child: const Text("get BIS FLAG",style: TextStyle(color: Colors.white))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                              imageUrl: viewModel.photoModel?.urls.raw ??
                                  defaultImage,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: 200.0,
                                height: 200.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              placeholder: (context, url) => const SizedBox(
                                  width: 80.0,
                                  height: 80.0,
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ],
                        )
                      ]),
                )));
  }

  @override
  PhotosViewModel viewModelBuilder(BuildContext context) => PhotosViewModel();
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, this.onPressed, required this.child});
  final void Function()? onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        width: 150.w,
        height: 100.h,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(AppColors.kcPrimaryColor)),
          child: child,
        ));
  }
}
