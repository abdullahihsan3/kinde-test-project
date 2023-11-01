import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stacked_starter/constants/app_strings.dart';
import 'package:flutter_stacked_starter/constants/app_text.dart';
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
          title: const Text('Random Photo',style: kManropeText,),
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
        body: viewModel.isBusy ? const Center(child: CircularProgressIndicator()): RefreshIndicator(
            onRefresh: () => viewModel.init(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                verticalSpaceMedium,
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:15.0),
                    child: ElevatedButton.icon(onPressed: (){
                      viewModel.navigateToProfileDetails();
                    }, icon: const Icon(Icons.person,color: Colors.white,), label: const Text("Profile Details",style: kManropeText,)),
                  ),
                ),
                verticalSpaceMedium,
                       ElevatedButton(onPressed: (){viewModel.getFlagInfo();}, child: const Text("Get Flag Info"),),
              ElevatedButton(onPressed: (){viewModel.getUserActivity();}, child: const Text("Get User Activity"),),
              ElevatedButton(onPressed: (){viewModel.getScopes();}, child: const Text("Get Scopes")),
              ElevatedButton(onPressed: (){viewModel.getClaim();}, child: const Text("Get Claims")),
              ElevatedButton(onPressed: (){
                viewModel.createOrg();
              }, child: const Text("Create Org")),
              ElevatedButton(onPressed: (){viewModel.isAuthenticated();}, child: const Text("Is Authenticated")),
              ElevatedButton(onPressed: (){viewModel.getUserDetails();}, child: const Text("Get User Details")),
              ElevatedButton(onPressed: (){viewModel.getPermissions();}, child: const Text("Get Permissions")),
              ElevatedButton(onPressed: (){viewModel.getUserProfileV2();}, child: const Text("Get User Profile")),
              ElevatedButton(onPressed: (){viewModel.getClaimOrganization();}, child: const Text("Get Claim Organization")),
              ElevatedButton(onPressed: (){viewModel.getOrganizations();}, child: const Text("Get Organizations")),
              ElevatedButton(onPressed: (){viewModel.getFeatureFlags();}, child: const Text("Get Feature Flags")),
              ElevatedButton(onPressed: () async {debugPrint(await viewModel.returnAccessToken());},child: const Text("get Token"),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: viewModel.photoModel?.urls.raw ?? defaultImage,
                      imageBuilder: (context, imageProvider) => Container(
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
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ],
                )
              ]),
            )));
  }

  @override
  PhotosViewModel viewModelBuilder(BuildContext context) => PhotosViewModel();
}
