import 'package:challenge_pinapp/comments/domain/entities/comment.dart';
import 'package:challenge_pinapp/comments/domain/use_cases/get_comments.dart';
import 'package:challenge_pinapp/core/presentation/controllers/content_controller.dart';
import 'package:get/get.dart';

class CommentsController extends GetxController with StateMixin {
  final GetComments getCommentsUseCase;
  late List<Comment> comments;
  late int postId;
  late ContentController content;

  CommentsController({required this.getCommentsUseCase});

  @override
  void onInit() async {
    super.onInit();
    content = Get.find<ContentController>();
    postId = Get.arguments['postId'];
    await getComments();
  }

  Future<void> getComments() async {
    change(null, status: RxStatus.loading());
    final result = await getCommentsUseCase(ParamsGetComments(postId: postId));
    result.fold((failure) => change(null, status: RxStatus.error()),
        (commentList) {
      comments = commentList;
      change(null, status: RxStatus.success());
    });
  }
}
