import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://student.valuxapps.com/api/",
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
  }) async {

    dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
    };

    return dio!.post(url, data: data, queryParameters: query);
  }
}
