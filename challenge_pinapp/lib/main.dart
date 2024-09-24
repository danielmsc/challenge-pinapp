import 'package:challenge_pinapp/core/presentation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/data/network/dio_client.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<DioClient>(DioClient(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Challenge PinApp',
      getPages: Pages.pages,
      initialRoute: Routes.postsPage,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
