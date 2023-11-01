import 'package:flutter/material.dart';
import 'package:flutter_stacked_starter/ui/photos/photos_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PhotosView extends StackedView<PhotosViewModel> {
  const PhotosView({super.key});

  @override
  Widget builder(BuildContext context, PhotosViewModel viewModel, Widget? child) {
    return  Scaffold(
      
      appBar: AppBar(
      backgroundColor: Colors.white,
      actions: [
        GestureDetector(
          onTap: ()=>viewModel.logout(),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.logout,color: Colors.black,),
          ))
      ],
      leading: GestureDetector(
      onTap: ()=>viewModel.back(),
      child: const Icon(Icons.arrow_back_ios)),),
      body: const Center(child: Text("Photos View"),),);
  }

  @override
  PhotosViewModel viewModelBuilder(BuildContext context) => PhotosViewModel();
}
