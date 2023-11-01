import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stacked_starter/app/app.locator.dart';
import 'package:flutter_stacked_starter/constants/app_urls.dart';
import 'package:flutter_stacked_starter/models/application_models.dart';
import 'package:flutter_stacked_starter/models/photos_model.dart';
import 'package:flutter_stacked_starter/services/api_service.dart';

class PhotosService{
  final _apiService = locator<ApiService>();
  Future<PhotoModel?> getRandomPhoto() async {
    try {
      String url = '${AppUrls.baseUrl}/photos/random?client_id=${dotenv.env['UNSPLASH_ACCESS_KEY']}';
     ApiResponse response = await _apiService.get(url: url);
     return PhotoModel.fromJson(response.data) ;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}