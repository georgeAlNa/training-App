import 'package:get/get.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/services/services.dart';

abstract class AllItemsInPersonalController extends GetxController {
  goToUserInfoPage();
  goToAllCoachesPage();
  goToLanguagePage();
  goToTargetWeightPage();
  goToEditInfoPage();
  logout();
}

class AllItemsInPersonalControllerImp extends AllItemsInPersonalController {
  MyService myService = Get.find();

  @override
  goToUserInfoPage() {
    Get.toNamed(AppRoutes.userInfo);
  }

  @override
  goToAllCoachesPage() {
    Get.toNamed(AppRoutes.getAllCoaches);
  }

  @override
  goToLanguagePage() {
    Get.toNamed(AppRoutes.language);
  }

  @override
  goToTargetWeightPage() {
    Get.toNamed(AppRoutes.targetWeight);
  }

  @override
  goToEditInfoPage() {
    Get.toNamed(AppRoutes.calories);
  }

  @override
  logout() {
    myService.sharedPreferences.remove('stepLogin');
    myService.sharedPreferences.remove('name');
    myService.sharedPreferences.remove('email');
    myService.sharedPreferences.remove('token');
    Get.offAllNamed(AppRoutes.login);
  }
}
