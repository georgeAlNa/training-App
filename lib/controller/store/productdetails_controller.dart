import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/store/allproductsbycategory_data.dart';

abstract class StoreProductDetailsController extends GetxController {
  getProductDetails();
  goToAddToCart();
}

class StoreProductDetailsControllerImp extends StoreProductDetailsController {
  StoreProductByCategoryData storeProductByCategoryData =
      StoreProductByCategoryData(Get.find());
  MyService myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List productDetailsStoreList = [];
  String? token;
  dynamic idOfCat;
  dynamic idOfProduct;
  dynamic idOfProductToAddToCart;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    idOfCat = Get.arguments['idOfCat'];
    idOfProduct = Get.arguments['idOfProduct'];
    getProductDetails();
    super.onInit();
  }

  @override
  getProductDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await storeProductByCategoryData.getData(token!, idOfCat);
    print('response ===== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        productDetailsStoreList.addAll(response['data']);
        idOfProductToAddToCart = productDetailsStoreList[idOfProduct]['id'];
      } else {
        Get.defaultDialog(title: 'Empty !', middleText: 'No Products Yet');
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  goToAddToCart() {
    Get.toNamed(AppRoutes.storeAddToCart, arguments: {
      'proId': idOfProductToAddToCart,
    });
  }
}
