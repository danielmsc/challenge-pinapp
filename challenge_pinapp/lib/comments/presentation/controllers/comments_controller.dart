import 'package:challenge_pinapp/comments/domain/entities/comment.dart';
import 'package:challenge_pinapp/comments/domain/use_cases/get_comments.dart';
import 'package:get/get.dart';

class CommentsController extends GetxController with StateMixin {
  final GetComments getCommentsUseCase;
  late List<Comment> comments;

  CommentsController({required this.getCommentsUseCase});

  @override
  void onInit() async {
    super.onInit();
    final int postId = Get.arguments['postId'];
    await getComments(postId);
  }

  Future<void> getComments(int postId) async {
    final result = await getCommentsUseCase(ParamsGetComments(postId: postId));
    result.fold((failure) => null, (commentList) {
      comments = commentList;
      change(null, status: RxStatus.success());
    });
  }
}
