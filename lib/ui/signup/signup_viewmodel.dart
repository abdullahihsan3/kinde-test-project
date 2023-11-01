import 'package:flutter/material.dart';
import 'package:flutter_stacked_starter/app/app.locator.dart';
import 'package:flutter_stacked_starter/app/app.router.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final GlobalKey _key = GlobalKey<FormState>();
  final sdk = KindeFlutterSDK.instance;
  GlobalKey get key => _key;
  void back() => _navigationService.back();

  void saveData() {
  }

  signUp() async {
     await runBusyFuture(sdk.register(),busyObject: 'kindeBusy');
     final token = await sdk.getToken();
     debugPrint("Token Is: $token");
     _navigationService.navigateToPhotosView();
  } 
}