import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/store/allcategorystore_data.dart';

abstract class StoreCategoryController extends GetxController {
  getCategory();
  goToProductByCategory(dynamic idOfCategoryStore);
}

class StoreCategoryControllerImp extends StoreCategoryController {
  StoreCategoryData storeCategoryData = StoreCategoryData(Get.find());
  MyService myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List allCategoryStoreList = [];
  String? token;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    getCategory();
    super.onInit();
  }

  @override
  getCategory() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await storeCategoryData.getData(token!);
    print('response ===== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        allCategoryStoreList.addAll(response['data']);
      } else {
        Get.defaultDialog(title: 'Empty !', middleText: 'No Category Yet');
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  goToProductByCategory(idOfCategoryStore) {
    Get.toNamed(AppRoutes.storeProductByCategory, arguments: {
      'idOfCategoryStore': idOfCategoryStore,
    });
  }
}
