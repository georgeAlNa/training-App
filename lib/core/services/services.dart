import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyService extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyService> init() async {
    // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    // final token = FirebaseMessaging.instance.getToken();
    // print(token);
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initServices() async {
  await Get.putAsync(() => MyService().init());
}
