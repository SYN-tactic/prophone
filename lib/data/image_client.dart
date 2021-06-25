import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pro_phone_challenge/models/image_base.dart';
import 'package:pro_phone_challenge/models/search_results.dart';
// The client for retrieving data from the API.
class ImageClient {

  final String PIXABAY_KEY = '22226430-92e7bdf12b3842f71e9588050';
  final dio = Dio(BaseOptions(
    baseUrl: 'https://pixabay.com/api/?key=$PIXABAY_KEY',
    
  ));
  // dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true, error: true));

  Future<List<ImageSearchResult>> searchImages(String query) async {
    final queryEncoded = query.replaceAll(RegExp(' +'), '+');
    final response = await dio.get(
      '&get=$queryEncoded&image_type=photo'
    );

    if (response.statusCode == 200) {
      return SearchResult.fromJson(response).searchItems.images;
    } else {
      throw MetaResponse.fromJson(response).searchResultError;
    }
  }
}