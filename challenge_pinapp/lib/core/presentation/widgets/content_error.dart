import 'package:challenge_pinapp/core/presentation/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef RetryCallback = Future<void> Function();

class ContentError extends StatelessWidget {
  final RetryCallback retryCallback;

  const ContentError({super.key, required this.retryCallback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(size: 48.0, Icons.error_outline),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
            child: Text(
              'errorLoadingContent'.tr,
              style: Styles.bodyStyle(),
            ),
          ),
          ElevatedButton(onPressed: retryCallback, child: Text('retry'.tr))
        ],
      ),
    );
  }
}
