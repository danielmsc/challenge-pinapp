import 'package:challenge_pinapp/core/presentation/widgets/content_error.dart';
import 'package:challenge_pinapp/core/presentation/widgets/list_item.dart';
import 'package:challenge_pinapp/posts/presentation/controllers/posts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsPage extends GetView<PostsController> {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('posts'.tr),
      ),
      body: controller.obx(
        (_) => _Posts(controller: controller),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (_) => ContentError(
          retryCallback: controller.getPosts,
        ),
      ),
    );
  }
}

class _Posts extends StatelessWidget {
  final PostsController controller;

  const _Posts({required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: controller.content.posts.length,
      itemBuilder: (context, index) => Obx(
        () => ListItem(
          color: Colors.white,
          postId: controller.content.posts[index].id,
          title: controller.content.posts[index].title,
          body: controller.content.posts[index].body,
          shouldShowLikeIcon: true,
          liked: controller.content.posts[index].liked,
          onTap: controller.goToComments,
        ),
      ),
    );
  }
}
