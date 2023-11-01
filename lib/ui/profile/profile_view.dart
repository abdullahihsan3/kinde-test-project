import 'package:flutter/material.dart';
import 'package:flutter_stacked_starter/constants/app_text.dart';
import 'package:flutter_stacked_starter/ui/profile/profile_viewmodel.dart';
import 'package:flutter_stacked_starter/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StackedView<ProfileViewModel> {
const ProfileView({super.key});

@override
void onViewModelReady(ProfileViewModel viewModel){
  super.onViewModelReady(viewModel);
  viewModel.getProfileDetails();
  viewModel.getUserProfileDetails();
}

@override
Widget builder(
BuildContext context,
ProfileViewModel viewModel,
Widget? child
) {
return Scaffold(
  appBar:  AppBar(
    title:  Text('Profile Details',
    style: kManropeText.copyWith(color: Colors.black),),
    backgroundColor: Colors.white,
    ),
  body:  Column(
    children: [
      UserDetailsWidget(
        title: 'getUser Method',
        firstName: viewModel.userProfile?.firstName ?? '',
        lastName: viewModel.userProfile?.lastName ?? '',
        email: viewModel.userProfile?.preferredEmail ?? '',
      ),
      verticalSpaceMedium,
          UserDetailsWidget(
        title: 'getUserDetails Method',
        firstName: viewModel.userDetails?.givenName ?? '',
        lastName: viewModel.userDetails?.familyName ?? '',
        email: viewModel.userDetails?.email ?? '',
      ),
    ],
  ),
);
}
@override
ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();
}

class UserDetailsWidget extends ViewModelWidget<ProfileViewModel> {
  const UserDetailsWidget({
    super.key,
    required this.title , required this.firstName, required this.lastName, required this.email, 
  });
  final String title;
  final String firstName;
  final String lastName;
  final String email;
  @override
  Widget build(BuildContext context,ProfileViewModel viewModel) {
    return Column(
      children: [
        Title(color: Colors.black,child:  Text(title,style: kRobotoText.copyWith(
          fontWeight: kFwBold,
          fontSize: 20
        ),),),
        ListTile(
          title: Text(firstName,style: kRobotoText.copyWith(
            fontWeight: kFwRegular,
            fontSize: 18
            
          ),),
        ),
        ListTile(
          title: Text(lastName,style: kRobotoText.copyWith(
            fontWeight: kFwRegular,
            fontSize: 18
          ),),
        ),
        ListTile(
          title: Text(email,style: kRobotoText.copyWith(
            fontWeight: kFwRegular,
            fontSize: 18
          ),),
        ),
      ],
    );
  }
}