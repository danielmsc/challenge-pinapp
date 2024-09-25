import 'package:challenge_pinapp/comments/domain/use_cases/get_comments.dart';
import 'package:challenge_pinapp/comments/presentation/controllers/comments_controller.dart';
import 'package:challenge_pinapp/core/utils/injector.dart';
import 'package:get/get.dart';

class CommentsBindings extends Bindings {
  @override
  void dependencies() {
    final getCommentsUseCase =
        GetComments(repository: Injector.createCommentsRepository());

    Get.lazyPut<CommentsController>(
        () => CommentsController(getCommentsUseCase: getCommentsUseCase));
  }
}
