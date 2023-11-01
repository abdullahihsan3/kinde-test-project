import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
Future<void> initEncryptedHive() async {
    const FlutterSecureStorage secureStorage =  FlutterSecureStorage();
  var containsEncryptionKey = await secureStorage.containsKey(key: 'encryptionKey');
  if (!containsEncryptionKey) {
    var key = Hive.generateSecureKey();
    await secureStorage.write(key: 'encryptionKey', value: base64UrlEncode(key));
  }
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await initEncryptedHive();
  await dotenv.load(fileName: ".env");
  await KindeFlutterSDK.initializeSDK(
    authDomain: dotenv.env['KINDE_AUTH_DOMAIN']!,
    authClientId: dotenv.env['KINDE_AUTH_CLIENT_ID']!,
    loginRedirectUri: dotenv.env['KINDE_LOGIN_REDIRECT_URI']!,
    logoutRedirectUri: dotenv.env['KINDE_LOGOUT_REDIRECT_URI']!,
    audience: dotenv.env['KINDE_AUDIENCE'],
		scopes: ["email","profile","offline","openid"] 
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(392.72, 759.27),
      child: MaterialApp(
        title: 'Photos App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            centerTitle: true,
          ),
        ),
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
      ),
    );
  }
}
