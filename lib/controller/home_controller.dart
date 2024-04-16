import 'package:get/get.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/services/services.dart';

abstract class HomeController extends GetxController {
  initialData();
  logOut();
}

class HomeControllerImp extends HomeController {
  MyService myService = Get.find();
  String? name;
  String? email;
  String? token;
  String? userName;
  String? userEmail;
  @override
  initialData() {
    name = myService.sharedPreferences.getString('name');
    email = myService.sharedPreferences.getString('email');
    token = myService.sharedPreferences.getString('token');
  }

  @override
  void onInit() {
    initialData();
    // userName = Get.arguments['name'];
    //userEmail = Get.arguments['email'];
    super.onInit();
  }

  @override
  logOut() {
    myService.sharedPreferences.remove('stepLogin');
    myService.sharedPreferences.remove('name');
    myService.sharedPreferences.remove('email');
    myService.sharedPreferences.remove('token');
    Get.offAllNamed(AppRoutes.login);
    print('${name}');
    print('${email}');
    print('${token}');
  }
}
