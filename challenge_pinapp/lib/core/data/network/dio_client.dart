import 'package:challenge_pinapp/core/data/network/exceptions.dart';
import 'package:dio/dio.dart';

class DioClient {
  Future<Dio> _getDioClient() async {
    final options = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    );

    return Dio(options);
  }

  Future<Response<dynamic>> get(String path,
      {Map<String, dynamic>? params}) async {
    try {
      final dio = await _getDioClient();
      return await dio.get(path, queryParameters: params);
    } on DioException catch (e) {
      throw ExceptionUtils.getExceptionType(e);
    }
  }
}
