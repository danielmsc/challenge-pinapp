// Mocks generated by Mockito 5.4.4 from annotations
// in challenge_pinapp/test/comments/presentation/controllers/comments_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:challenge_pinapp/comments/domain/entities/comment.dart' as _i7;
import 'package:challenge_pinapp/comments/domain/repositories/comments_repository.dart'
    as _i2;
import 'package:challenge_pinapp/comments/domain/use_cases/get_comments.dart'
    as _i4;
import 'package:challenge_pinapp/core/domain/entities/failures.dart' as _i6;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCommentsRepository_0 extends _i1.SmartFake
    implements _i2.CommentsRepository {
  _FakeCommentsRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetComments].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetComments extends _i1.Mock implements _i4.GetComments {
  @override
  _i2.CommentsRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeCommentsRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeCommentsRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.CommentsRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.Comment>>> call(
          _i4.ParamsGetComments? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.Comment>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.Comment>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.Comment>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.Comment>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.Comment>>>);
}
