import 'package:challenge_pinapp/core/domain/api_network.dart';
import 'package:challenge_pinapp/core/domain/entities/failures.dart';
import 'package:challenge_pinapp/posts/data/data_sources/posts_data_source.dart';
import 'package:challenge_pinapp/posts/domain/entities/post.dart';
import 'package:challenge_pinapp/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class PostsRepositoryImpl extends PostsRepository {
  final PostsDataSource dataSource;

  PostsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<Post>>> getPosts() async {
    return ApiNetwork.call<List<Post>>(() async => await dataSource.getPosts());
  }
}
