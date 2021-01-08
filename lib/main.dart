import 'package:Minders/controllers/bindings/bindingController.dart';
import 'package:Minders/utils/appRouter.dart';
import 'package:Minders/utils/locales.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Locales(),
      locale: Locale('en'),
      initialBinding: BindingController(),
      onGenerateRoute: AppRouter.generateGlobalRoutes,
      initialRoute: AppRouter.splashRoute,
    );
  }
}
