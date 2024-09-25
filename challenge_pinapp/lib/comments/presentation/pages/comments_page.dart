import 'package:challenge_pinapp/comments/presentation/controllers/comments_controller.dart';
import 'package:challenge_pinapp/core/presentation/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentsPage extends GetView<CommentsController> {
  const CommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('comments'.tr),
      ),
      body: controller.obx(
        (_) => _Comments(controller: controller),
        onLoading: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _Comments extends StatelessWidget {
  final CommentsController controller;

  const _Comments({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => ListItem(
            color: Colors.white10,
            postId: controller.content.posts[controller.postId - 1].id,
            title: controller.content.posts[controller.postId - 1].title,
            body: controller.content.posts[controller.postId - 1].body,
            shouldShowLikeIcon: true,
            liked: controller.content.posts[controller.postId - 1].liked,
            likeCallback: controller.content.flipPostLike,
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.comments.length,
            itemBuilder: (context, index) => ListItem(
              color: Colors.white,
              title: controller.comments[index].name,
              body: controller.comments[index].body,
              email: controller.comments[index].email,
              shouldShowLikeIcon: false,
            ),
          ),
        ),
      ],
    );
  }
}
