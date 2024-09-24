import 'package:challenge_pinapp/comments/presentation/controllers/comments_controller.dart';
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
    return ListView.builder(
      shrinkWrap: true,
      itemCount: controller.comments.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(controller.comments[index].name),
        subtitle: Text(controller.comments[index].body),
      ),
    );
  }
}
