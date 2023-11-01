import 'package:dio/dio.dart';
import 'package:flutter_stacked_starter/constants/app_urls.dart';
import 'package:flutter_stacked_starter/constants/constants.dart';


class DioClient {
  static BaseOptions options = BaseOptions(
    baseUrl: AppUrls.baseUrl,
    connectTimeout: const Duration(seconds: connectionTimeout),
    receiveTimeout: const Duration(seconds: receiveTimeout),
    contentType: Headers.jsonContentType,
  );

  static Dio get dio => Dio(options);
}
