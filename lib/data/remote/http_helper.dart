import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/constants/end_points.dart';

class HttpHelper {
  static dynamic postData({
    required String endPoint,
    required Map<String, dynamic> body,
    Map<String, dynamic>? query,
  }) async {
    Uri uri = Uri.https(baseURL, endPoint);
    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
    return response;
  }

  static getData({
    required String endPoint,
    required Map<String, dynamic> query,
    String? token,
  }) async {
    var uri = Uri.http(baseURL, endPoint);
    final uriResponse = await http.get(
      uri,
      headers: token != null
          ? {
              'Authorization': 'Bearer $token',
            }
          : {},
    );
  }
}
