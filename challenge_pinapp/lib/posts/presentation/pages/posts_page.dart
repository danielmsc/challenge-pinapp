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
      itemCount: controller.posts.length,
      itemBuilder: (context, index) => ListItem(
        index: index + 1,
        postId: controller.posts[index].id,
        title: controller.posts[index].title,
        body: controller.posts[index].body,
        onTap: controller.goToComments,
      ),
    );
  }
}
