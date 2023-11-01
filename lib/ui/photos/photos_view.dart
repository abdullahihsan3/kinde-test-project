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
        body: RefreshIndicator(
            onRefresh: () => viewModel.init(),
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
            ])));
  }

  @override
  PhotosViewModel viewModelBuilder(BuildContext context) => PhotosViewModel();
}
