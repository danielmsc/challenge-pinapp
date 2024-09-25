import 'package:challenge_pinapp/core/presentation/controllers/content_controller.dart';
import 'package:challenge_pinapp/core/presentation/routes.dart';
import 'package:challenge_pinapp/posts/domain/use_cases/get_posts.dart';
import 'package:get/get.dart';

class PostsController extends GetxController with StateMixin {
  final GetPosts getPostsUseCase;
  late ContentController content;

  PostsController({required this.getPostsUseCase});

  @override
  void onInit() async {
    super.onInit();
    content = Get.find<ContentController>();
    await getPosts();
  }

  Future<void> getPosts() async {
    final result = await getPostsUseCase(NoParamsGetPosts());
    result.fold((failure) => null, (postList) {
      content.posts.value = postList;
      change(null, status: RxStatus.success());
    });
  }

  Future<void> goToComments(int postId) async {
    await Get.toNamed(Routes.commentsPage, arguments: {'postId': postId});
  }
}
