import 'package:f22_task/app/routes/routes.dart';
import 'package:f22_task/app/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'app/routes/router.dart';
import 'app/service/api_service.dart';

void main() async {
  Loggy.initLoggy(
    logPrinter: const PrettyDeveloperPrinter(),
  );
  await inject();
  runApp(const MyApp());
}

Future<void> inject() async {
  Get.lazyPut(() => ApiService(), fenix: true);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Insta View',
      builder: (context, child) {
        ErrorWidget.builder = (details) {
          return CustomErrorWidget(errorDetails: details);
        };
        return child!;
      },
      initialRoute: Routes.HOME,
      onGenerateRoute: PageRouter.onGenerateRoute,
    );
  }
}
