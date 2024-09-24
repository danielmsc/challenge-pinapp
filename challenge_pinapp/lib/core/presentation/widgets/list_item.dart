import 'package:challenge_pinapp/core/presentation/styles.dart';
import 'package:flutter/material.dart';

typedef PostCallback = Future<void> Function(int postId);

class ListItem extends StatelessWidget {
  final int index;
  final String title;
  final String body;
  final int? postId;
  final String? email;
  final PostCallback? onTap;

  const ListItem(
      {super.key,
      required this.index,
      required this.title,
      required this.body,
      this.postId,
      this.email,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
      child: GestureDetector(
        onTap: onTap != null ? () => onTap!(postId!) : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '#$index',
              style: Styles.indexStyle(),
            ),
            if (email != null) ...[
              Text(
                email!,
                style: Styles.emailStyle(),
              ),
            ],
            Text(
              title,
              style: Styles.titleStyle(),
            ),
            Text(
              body,
              style: Styles.bodyStyle(),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
