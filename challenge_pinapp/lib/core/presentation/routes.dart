import 'package:challenge_pinapp/posts/bindings/posts_bindings.dart';
import 'package:challenge_pinapp/posts/presentation/pages/posts_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  static const postsPage = '/postsPage';
  static const commentsPage = '/commentsPage';
}

class Pages {
  static final pages = [
    GetPage(
      name: Routes.postsPage,
      page: () => const PostsPage(),
      binding: PostsBindings(),
    ),
  ];
}
