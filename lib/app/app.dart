import 'package:flutter_stacked_starter/services/api_service.dart';
import 'package:flutter_stacked_starter/services/dio_service.dart';
import 'package:flutter_stacked_starter/services/photos_service.dart';
import 'package:flutter_stacked_starter/services/user_service.dart';
import 'package:flutter_stacked_starter/ui/login/logn_view.dart';
import 'package:flutter_stacked_starter/ui/photos/photos_view.dart';
import 'package:flutter_stacked_starter/ui/profile/profile_view.dart';
import 'package:flutter_stacked_starter/ui/signup/signup_view.dart';
import 'package:flutter_stacked_starter/ui/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: PhotosView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: StartupView,initial: true),
  ],
  dependencies: [
    LazySingleton(classType: PhotosService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DioService, asType: ApiService),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  /** Serves No Purpose */
}
