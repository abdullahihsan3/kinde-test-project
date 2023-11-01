import 'package:flutter/material.dart';
import 'package:flutter_stacked_starter/app/app.locator.dart';
import 'package:flutter_stacked_starter/app/app.logger.dart';
import 'package:flutter_stacked_starter/app/app.router.dart';
import 'package:flutter_stacked_starter/models/photos_model.dart';
import 'package:flutter_stacked_starter/services/photos_service.dart';
import 'package:hive/hive.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PhotosViewModel extends BaseViewModel {
  final log = getLogger('HomeViewModel');
  final _navigationService = locator<NavigationService>();
  final _photosService = locator<PhotosService>();
  final sdk = KindeFlutterSDK.instance;
  PhotoModel? _photoModel;
  PhotoModel? get photoModel => _photoModel;



  void back() => _navigationService.back();


  void logout() async {
    await sdk.logout();
    var box = await hiveEncryptedBox();
    await box.put('token', null);
    _navigationService.replaceWithLoginView();
  }

  Future<void> init() async {
     _photoModel = await runBusyFuture(_photosService.getRandomPhoto());
     rebuildUi();
  }

  void navigateToProfileDetails() {
    _navigationService.navigateToProfileView();
  }


  void getFeatureFlags() async {
    String? token = await sdk.getToken();
    final decoded = JwtDecoder.decode(token!);
    debugPrint(decoded['feature_flags'].toString());
  }

  void getFlagInfo() {
    final info = sdk.getFlag(
        code: 'get-current-location', defaultValue: '', type: FlagType.string);
    debugPrint(info?.code);
  }

  Future<void> getUserActivity() async {
    try {
      final user = await sdk.getUser();
      debugPrint(user.toString());
    } catch (e) {
      debugPrint('Exception when calling UsersApi->getUserData: $e\n');
    }
  }

  Future<void> getScopes() async {
    debugPrint(sdk.authState?.scope ?? '');
  }

  void getUserDetails() {
    debugPrint(sdk.getUserDetails().toString());
  }

  Future<void> createOrg() async {
    await sdk.createOrg(orgName: 'DevsincOrgNew');
    
  }

  Future<void> getClaim() async {
    final claim = sdk.getClaim(claim: 'iss');
    final token = await sdk.getToken();
    debugPrint("Token $token");
    debugPrint("Claim $claim");
  }

  Future<void> isAuthenticated() async {
    final isAuthenticated = await sdk.isAuthenticate();
    debugPrint(isAuthenticated.toString());
  }

  Future<void> getPermissions() async {
    final permissions = sdk.getPermissions();
    debugPrint(permissions.toString());
  }

  Future<void> getUserProfileV2() async {
    final profile = await sdk.getUserProfileV2();
    debugPrint(profile.toString());
  }

  Future<void> getClaimOrganization() async {
    final organization = sdk.getOrganization();
    debugPrint(organization.toString());
  }

  Future<void> getOrganizations() async {
    final userOrganizations = sdk.getUserOrganizations();
    debugPrint(userOrganizations.toString());
  }

  Future <Box> hiveEncryptedBox() async {
    var box = await Hive.openBox('myBox');
    return box;
}
Future < String > returnAccessToken() async {
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
Future <String> getNewToken() async {
    String ? token = await sdk.getToken();
    if (token == null) return 'Refresh Token Expired'; // Redirect user to the login page
    var box = await hiveEncryptedBox();
    await box.put('token', token);
    return token;
}
}
