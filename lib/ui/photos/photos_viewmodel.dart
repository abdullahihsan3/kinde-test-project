import 'package:flutter_stacked_starter/app/app.locator.dart';
import 'package:flutter_stacked_starter/app/app.logger.dart';
import 'package:flutter_stacked_starter/app/app.router.dart';
import 'package:flutter_stacked_starter/models/photos_model.dart';
import 'package:flutter_stacked_starter/services/photos_service.dart';
import 'package:flutter_stacked_starter/ui/utils/hive_encrypted_box.dart';
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
}
