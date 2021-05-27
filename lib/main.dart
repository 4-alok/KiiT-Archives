import 'package:get/get.dart';
import 'app/global/custom_transition.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:kiit_app/app/services/auth_services.dart';

void main() async {
  Get.put(() => AuthService());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      customTransition: SharedAxisScaleTransition(),
    ),
  );
}
