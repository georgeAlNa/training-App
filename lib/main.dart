import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/bindings/initial_binding.dart';
import 'package:training_app/core/localization/changelocale.dart';
import 'package:training_app/core/localization/translations.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/routes.dart';

// SharedPreferences? share;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const TrainingApp());
}

class TrainingApp extends StatelessWidget {
  const TrainingApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      translations: MyTranslations(),
      initialBinding: InitialBindings(),
      title: 'Training App',
      getPages: routes,
    );
  }
}
