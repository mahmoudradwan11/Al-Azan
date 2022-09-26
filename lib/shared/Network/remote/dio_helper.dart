import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://api.aladhan.com',
      receiveDataWhenStatusError: true,
    ),
    );
  }
  static Future<Response> getData(
      {required String url, Map<String, dynamic>? query,String lang = 'ar',String?token}) async {
    dio.options.headers = {
      'Content-Type':'application/json',
      'Accept': 'application/json',
    };
    return await dio.get(
        url,
        queryParameters: query
    );
  }

  static Future<Response> postData(
      {required String url, Map<String, dynamic>? query, required Map<String, dynamic> data,String lang = 'ar',String?token}) async {
    dio.options.headers = {
      'Content-Type':'application/json',
      'lang':'en',
      'Authorization': token??'',
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
  static Future<Response> putData(
      {required String url, Map<String, dynamic>? query, required Map<String, dynamic> data,String lang = 'ar',String?token}) async {
    dio.options.headers = {
      'Content-Type':'application/json',
      'lang':'en',
      'Authorization': token??'',
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
