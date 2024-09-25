import 'package:challenge_pinapp/core/data/network/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return a TimeoutException', () {
    final dioException = DioException(
      requestOptions: RequestOptions(),
      type: DioExceptionType.connectionTimeout,
    );

    final exception = ExceptionUtils.getExceptionType(dioException);

    expect(exception, isA<TimeoutException>());
  });

  test('Should return a NetworkException', () {
    final dioException = DioException(
      requestOptions: RequestOptions(),
      type: DioExceptionType.connectionError,
    );

    final exception = ExceptionUtils.getExceptionType(dioException);

    expect(exception, isA<NetworkException>());
  });
}
