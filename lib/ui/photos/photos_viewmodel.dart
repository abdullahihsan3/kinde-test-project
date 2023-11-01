import 'package:flutter_stacked_starter/app/app.locator.dart';
import 'package:flutter_stacked_starter/app/app.logger.dart';
import 'package:flutter_stacked_starter/app/app.router.dart';
import 'package:flutter_stacked_starter/ui/utils/hive_encrypted_box.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PhotosViewModel extends BaseViewModel {
  final log = getLogger('HomeViewModel');
  final _navigationService = locator<NavigationService>();
  final sdk = KindeFlutterSDK.instance;
  void back() => _navigationService.back();


  void logout() async {
    await sdk.logout();
    var box = await hiveEncryptedBox();
    await box.put('token', null);
    _navigationService.replaceWithLoginView();
  }
}
