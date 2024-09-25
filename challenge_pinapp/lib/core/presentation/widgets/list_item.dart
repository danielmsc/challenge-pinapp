import 'package:challenge_pinapp/core/presentation/styles.dart';
import 'package:flutter/material.dart';

typedef PostCallback = Future<void> Function(int postId);
typedef LikeCallback = Function(int postId);

class ListItem extends StatelessWidget {
  final String title;
  final String body;
  final bool shouldShowLikeIcon;
  final Color color;
  final bool liked;
  final int? postId;
  final String? email;
  final PostCallback? onTap;
  final LikeCallback? likeCallback;

  const ListItem(
      {super.key,
      required this.title,
      required this.body,
      required this.shouldShowLikeIcon,
      required this.color,
      this.liked = false,
      this.postId,
      this.email,
      this.onTap,
      this.likeCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? () => onTap!(postId!) : null,
      child: Container(
        color: color,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (postId != null) ...[
                    Text(
                      '#$postId',
                      style: Styles.indexStyle(),
                    ),
                  ],
                  if (shouldShowLikeIcon) ...[
                    GestureDetector(
                      onTap: likeCallback != null
                          ? () => likeCallback!(postId!)
                          : null,
                      child: Icon(
                        size: 24.0,
                        liked
                            ? Icons.thumb_up_alt
                            : Icons.thumb_up_alt_outlined,
                      ),
                    ),
                  ]
                ],
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
      ),
    );
  }
}
