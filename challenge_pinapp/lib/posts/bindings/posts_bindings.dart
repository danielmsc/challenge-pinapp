import 'package:challenge_pinapp/core/utils/injector.dart';
import 'package:challenge_pinapp/posts/domain/use_cases/get_posts.dart';
import 'package:challenge_pinapp/posts/presentation/controllers/posts_controller.dart';
import 'package:get/get.dart';

class PostsBindings extends Bindings {
  @override
  void dependencies() {
    final getPostsUseCase =
        GetPosts(repository: Injector.createPostsRepository());

    Get.lazyPut<PostsController>(
        () => PostsController(getPostsUseCase: getPostsUseCase));
  }
}
