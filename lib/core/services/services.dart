import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:training_app/firebase_options.dart';

class MyService extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyService> init() async {
 
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    final token = await FirebaseMessaging.instance.getToken();
    print("token fire base : $token");
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initServices() async {
  await Get.putAsync(() => MyService().init());
}
