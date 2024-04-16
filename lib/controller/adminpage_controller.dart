import 'package:get/get.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/services/services.dart';

abstract class AdminController extends GetxController {
  goToAddExercise();
  goToAddChallenge();
  logoutAdmin();
}

class AdminControllerImp extends AdminController {
  MyService myService = Get.find();
  // String? tok;

  @override
  goToAddChallenge() {
    Get.toNamed(AppRoutes.addChallenge);
    //tok = myService.sharedPreferences.getString('tokenAdmin');
  }

  @override
  goToAddExercise() {
    Get.toNamed(AppRoutes.addExercise
        //  arguments: {
        //   'token' : tok,
        // }
        );
  }

  @override
  logoutAdmin() {
    myService.sharedPreferences.remove('stepLoginAdmin');
    myService.sharedPreferences.remove('emailAdmin');
    myService.sharedPreferences.remove('tokenAdmin');
    Get.offAllNamed(AppRoutes.loginAdmin);
  }

  @override
  void onInit() {
    // tok = Get.arguments['tok1'];
    super.onInit();
  }
}
