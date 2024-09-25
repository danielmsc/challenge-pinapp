import 'package:challenge_pinapp/comments/data/data_sources/comments_data_source.dart';
import 'package:challenge_pinapp/comments/data/repositories/comments_repository_impl.dart';
import 'package:challenge_pinapp/comments/domain/repositories/comments_repository.dart';
import 'package:challenge_pinapp/core/data/network/dio_client.dart';
import 'package:challenge_pinapp/posts/data/data_sources/posts_data_source.dart';
import 'package:challenge_pinapp/posts/data/repositories/posts_repository_impl.dart';
import 'package:challenge_pinapp/posts/domain/repositories/posts_repository.dart';
import 'package:get/get.dart';

class Injector {
  static PostsRepository createPostsRepository() {
    try {
      return Get.find<PostsRepository>();
    } catch (_) {
      final dataSource =
          Get.put(PostsDataSourceImpl(client: Get.find<DioClient>()));
      final repository = PostsRepositoryImpl(dataSource: dataSource);
      Get.put<PostsRepository>(repository);
      return repository;
    }
  }

  static CommentsRepository createCommentsRepository() {
    try {
      return Get.find<CommentsRepository>();
    } catch (_) {
      final dataSource =
          Get.put(CommentsDataSourceImpl(client: Get.find<DioClient>()));
      final repository = CommentsRepositoryImpl(dataSource: dataSource);
      Get.put<CommentsRepository>(repository);
      return repository;
    }
  }
}
