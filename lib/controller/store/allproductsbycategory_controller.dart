import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/store/allproductsbycategory_data.dart';

abstract class StoreProductByCategoryController extends GetxController {
  getProductByCategory();
  goToProductDetails(dynamic idOfProduct);
}

class StoreProductByCategoryControllerImp
    extends StoreProductByCategoryController {
  StoreProductByCategoryData storeProductByCategoryData =
      StoreProductByCategoryData(Get.find());
  MyService myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List allProductByCategoryStoreList = [];
  String? token;
  dynamic idOfCat;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    idOfCat = Get.arguments['idOfCategoryStore'];
    getProductByCategory();
    super.onInit();
  }

  @override
  getProductByCategory() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await storeProductByCategoryData.getData(token!, idOfCat);
    print('response ===== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        allProductByCategoryStoreList.addAll(response['data']);
      } else {
        Get.defaultDialog(title: 'Empty !', middleText: 'No Products Yet');
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  goToProductDetails(idOfProduct) {
    Get.toNamed(
      AppRoutes.storeProductDetails,
      arguments: {'idOfProduct': idOfProduct, 'idOfCat': idOfCat},
    );
  }
}
