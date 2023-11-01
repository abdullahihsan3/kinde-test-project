// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:flutter_stacked_starter/ui/login/logn_view.dart' as _i3;
import 'package:flutter_stacked_starter/ui/photos/photos_view.dart' as _i2;
import 'package:flutter_stacked_starter/ui/profile/profile_view.dart' as _i5;
import 'package:flutter_stacked_starter/ui/signup/signup_view.dart' as _i4;
import 'package:flutter_stacked_starter/ui/startup/startup_view.dart' as _i6;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;

class Routes {
  static const photosView = '/photos-view';

  static const loginView = '/login-view';

  static const signUpView = '/sign-up-view';

  static const profileView = '/profile-view';

  static const startupView = '/';

  static const all = <String>{
    photosView,
    loginView,
    signUpView,
    profileView,
    startupView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.photosView,
      page: _i2.PhotosView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i3.LoginView,
    ),
    _i1.RouteDef(
      Routes.signUpView,
      page: _i4.SignUpView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i5.ProfileView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i6.StartupView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.PhotosView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.PhotosView(),
        settings: data,
      );
    },
    _i3.LoginView: (data) {
      final args = data.getArgs<LoginViewArguments>(
        orElse: () => const LoginViewArguments(),
      );
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i3.LoginView(key: args.key, showBackButton: args.showBackButton),
        settings: data,
      );
    },
    _i4.SignUpView: (data) {
      final args = data.getArgs<SignUpViewArguments>(
        orElse: () => const SignUpViewArguments(),
      );
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i4.SignUpView(key: args.key, showBackButton: args.showBackButton),
        settings: data,
      );
    },
    _i5.ProfileView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.ProfileView(),
        settings: data,
      );
    },
    _i6.StartupView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.StartupView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class LoginViewArguments {
  const LoginViewArguments({
    this.key,
    this.showBackButton = true,
  });

  final _i7.Key? key;

  final bool showBackButton;

  @override
  String toString() {
    return '{"key": "$key", "showBackButton": "$showBackButton"}';
  }

  @override
  bool operator ==(covariant LoginViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.showBackButton == showBackButton;
  }

  @override
  int get hashCode {
    return key.hashCode ^ showBackButton.hashCode;
  }
}

class SignUpViewArguments {
  const SignUpViewArguments({
    this.key,
    this.showBackButton = true,
  });

  final _i7.Key? key;

  final bool showBackButton;

  @override
  String toString() {
    return '{"key": "$key", "showBackButton": "$showBackButton"}';
  }

  @override
  bool operator ==(covariant SignUpViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.showBackButton == showBackButton;
  }

  @override
  int get hashCode {
    return key.hashCode ^ showBackButton.hashCode;
  }
}

extension NavigatorStateExtension on _i8.NavigationService {
  Future<dynamic> navigateToPhotosView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.photosView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView({
    _i7.Key? key,
    bool showBackButton = true,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.loginView,
        arguments: LoginViewArguments(key: key, showBackButton: showBackButton),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUpView({
    _i7.Key? key,
    bool showBackButton = true,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.signUpView,
        arguments:
            SignUpViewArguments(key: key, showBackButton: showBackButton),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPhotosView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.photosView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView({
    _i7.Key? key,
    bool showBackButton = true,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.loginView,
        arguments: LoginViewArguments(key: key, showBackButton: showBackButton),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignUpView({
    _i7.Key? key,
    bool showBackButton = true,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.signUpView,
        arguments:
            SignUpViewArguments(key: key, showBackButton: showBackButton),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
