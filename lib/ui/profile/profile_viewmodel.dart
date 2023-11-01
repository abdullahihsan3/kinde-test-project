import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';
import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel {
  final sdk = KindeFlutterSDK.instance;
  UserProfile? _userProfile;
  UserProfile? get userProfile => _userProfile;

  UserDetails? _userDetails;
  UserDetails? get userDetails => _userDetails;

  Future<void> getProfileDetails() async {
    _userProfile = await sdk.getUser();
    rebuildUi();
  }

  Future<void> getUserProfileDetails() async {
    _userDetails = sdk.getUserDetails();
    rebuildUi();
  }

  void init() {
    getProfileDetails();
  }
}
