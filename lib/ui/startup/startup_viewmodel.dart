import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_stacked_starter/app/app.locator.dart';
import 'package:flutter_stacked_starter/app/app.router.dart';
import 'package:flutter_stacked_starter/ui/utils/hive_encrypted_box.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.logger.dart';

class StartupViewModel extends BaseViewModel {
  final log = getLogger('StartupViewModel');
  final _navigationService = locator<NavigationService>();
  final sdk = KindeFlutterSDK.instance;
  int? storyId;
  int? userId;

  bool navigated = false;

  StartupViewModel();

  Future<void> runStartupLogic() async {
    if (await returnAccessToken() != null) {
      _navigationService.navigateToPhotosView();
    } else {
      _navigationService.navigateToLoginView();
    }
  }



  Future<dynamic> returnAccessToken() async {
    final box = await hiveEncryptedBox();
    var token = box.get('token', defaultValue: '');
    if (token == '') {
      return await getNewToken();
    } else if (token != null) {
      bool hasExpired = JwtDecoder.isExpired(token);
      if (hasExpired) {
        return await getNewToken();
      }
      return token;
    } else {
      return getNewToken();
    }
  }

  Future<dynamic> getNewToken() async {
    try {
      String? token = await sdk.getToken();
      if (token == null) {
        return null;
      }
      var box = await hiveEncryptedBox();
      await box.put('token', token);
      return token;
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
      _navigationService.navigateToLoginView();
    }
  }

  @override
  void dispose() {
    // _intentDataStreamSubscription.cancel();
    super.dispose();
  }
}
