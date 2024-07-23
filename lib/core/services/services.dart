import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:training_app/firebase_options.dart';

class MyService extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyService> init() async {
    // Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    // await Firebase.initializeApp(
    // name: 'training-app-12f6c',
    // options: const FirebaseOptions(
    //   apiKey: 'AIzaSyCe8xmxodKu2Ed9V0RhLf-PJks-ArYX3pA',
    //   appId: '1:811733201627:android:64a66c7fba4c62fbe212fe',
    //   messagingSenderId: '811733201627',
    //   projectId: 'training-app-12f6c',
    //   storageBucket: 'training-app-12f6c.appspot.com',
    // ),
    // );
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
