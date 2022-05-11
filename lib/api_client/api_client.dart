import 'package:dio/dio.dart';
import 'package:gamereview/api_client/response.dart';
import 'package:gamereview/services/service_locator.dart';

class ApiClient {
  final String baseUrl;
  late Dio dio;
  ApiClient(this.baseUrl, Dio? dio) {
    this.dio = dio ?? Dio();
    this.dio
      ..httpClientAdapter
      ..options.headers = {
        Headers.contentTypeHeader: Headers.jsonContentType,
        'Accept-Encoding': '*'
      };
  }
  Future<ApiRespose> post(String uri,
      {data,
      Map<String, dynamic>? queryParamaters,
      Options? options,
      ProgressCallback? progressCallback}) async {
    try {
      logger.d(uri);
      var response = await dio.post(uri,
          data: data,
          queryParameters: queryParamaters,
          onReceiveProgress: progressCallback,
          options: options);
      if (response.statusCode == 200) {
        return ApiRespose(true, response.statusMessage,
            response: response.data);
      } else {
        return ApiRespose(false, response.statusMessage);
      }
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<ApiRespose> get(String uri, {data}) async {
    try {
      var response = await dio.get(uri);
      if (response.statusCode == 200) {
        logger.d(uri, response.statusCode);
        return ApiRespose(true, response.statusMessage,
            response: response.data);
      } else {
        logger.e(response.statusCode);
        return ApiRespose(false, response.statusMessage);
      }
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
