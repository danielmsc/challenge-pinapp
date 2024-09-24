import 'package:challenge_pinapp/core/l10n/strings.dart';
import 'package:challenge_pinapp/core/presentation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
      translations: Strings(),
      locale: const Locale('es', 'AR'),
      supportedLocales: const [Locale('es', 'AR')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
