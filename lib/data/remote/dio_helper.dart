import 'package:dio/dio.dart';
import 'package:testapp/constants/app_strings.dart';

import 'package:testapp/constants/end_points.dart';
import 'package:testapp/data/local/cache_helper.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> body,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio!.post(url, data: body);
  }

  static Future<Response> patchData({
    required String url,
  }) async {
    dio!.options.headers = {
      'Authorization':
          'Bearer ${CacheHelper.getDataFromSharedPreference(key: AppStrings.token)}'
    };
    return await dio!.patch(url);
  }
}
