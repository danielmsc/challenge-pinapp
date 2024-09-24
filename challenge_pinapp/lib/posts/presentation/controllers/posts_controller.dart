import 'package:challenge_pinapp/core/presentation/routes.dart';
import 'package:challenge_pinapp/posts/domain/entities/post.dart';
import 'package:challenge_pinapp/posts/domain/use_cases/get_posts.dart';
import 'package:get/get.dart';

class PostsController extends GetxController with StateMixin {
  final GetPosts getPostsUseCase;
  late List<Post> posts;

  PostsController({required this.getPostsUseCase});

  @override
  void onInit() async {
    super.onInit();
    await getPosts();
  }

  Future<void> getPosts() async {
    final result = await getPostsUseCase(NoParamsGetPosts());
    result.fold((failure) => null, (postList) {
      posts = postList;
      change(null, status: RxStatus.success());
    });
  }

  Future<void> goToComments(int postId) async {
    await Get.toNamed(Routes.commentsPage, arguments: {'postId': postId});
  }
}
