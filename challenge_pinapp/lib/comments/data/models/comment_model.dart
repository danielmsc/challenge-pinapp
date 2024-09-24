import 'package:challenge_pinapp/comments/domain/entities/comment.dart';

class CommentModel extends Comment {
  CommentModel(
      {required super.name, required super.email, required super.body});

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      CommentModel(name: json['id'], email: json['email'], body: json['body']);
}
