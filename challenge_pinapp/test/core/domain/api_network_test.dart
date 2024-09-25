import 'package:challenge_pinapp/core/data/network/exceptions.dart';
import 'package:challenge_pinapp/core/domain/api_network.dart';
import 'package:challenge_pinapp/core/domain/entities/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should execute the function successfully', () async {
    final function = Future.delayed(const Duration(milliseconds: 100));

    final result = await ApiNetwork.call(() async => await function);

    expect(result, isA<Right>());
  });

  test('Should return a NetworkFailure on NetworkException', () async {
    final function = Future.delayed(
        const Duration(milliseconds: 100), () => throw NetworkException());

    final result = await ApiNetwork.call(() async => await function);

    expect(result.isLeft(), true);
    result.fold(
        (failure) => expect(failure, isA<NetworkFailure>()), (_) => null);
  });

  test('Should return a TimeoutFailure on TimeoutException', () async {
    final function = Future.delayed(
        const Duration(milliseconds: 100), () => throw TimeoutException());

    final result = await ApiNetwork.call(() async => await function);

    expect(result.isLeft(), true);
    result.fold(
        (failure) => expect(failure, isA<TimeoutFailure>()), (_) => null);
  });
}
