import 'package:flutter/material.dart';
import 'package:flutter_stacked_starter/app/app.locator.dart';
import 'package:flutter_stacked_starter/app/app.router.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
   final _formKey = GlobalKey<FormState>();
   final _navigationService = locator<NavigationService>();
   GlobalKey<FormState> get formKey => _formKey;
   final sdk = KindeFlutterSDK.instance;
  

  void back()  => _navigationService.back();

  Future<void> login() async {
    final token = await runBusyFuture(sdk.login(),busyObject: 'kindeBusy');
    if(token!=null){
      _navigationService.navigateToPhotosView();
    }
  }

  void saveData() {
  }

  void navigateToSignup() => _navigationService.navigateToSignUpView();

}