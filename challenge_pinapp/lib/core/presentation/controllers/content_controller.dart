import 'package:challenge_pinapp/posts/domain/entities/post.dart';
import 'package:get/get.dart';

class ContentController extends GetxController {
  final posts = <Post>[].obs;

  void flipPostLike(int postId) {
    final index = posts.indexWhere((post) => post.id == postId);
    posts[index].liked = !posts[index].liked;
    posts.refresh();
  }
}
