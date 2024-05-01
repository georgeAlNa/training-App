import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/store/buyproduct.dart';
import 'package:training_app/data/datasource/remote/store/orderdetails_data.dart';

abstract class OrederDetailsController extends GetxController {
  getOrderDetails();
  buyProductByPoints(dynamic idOfProductRes);
}

class OrederDetailsControllerImp extends OrederDetailsController {
  OrederDetailsData orederDetailsData = OrederDetailsData(Get.find());
  BuyProductByPointsData buyProductByPointsData =
      BuyProductByPointsData(Get.find());
  MyService myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List orderDetailsList = [];
  String? token;
  dynamic idOfOrder;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    idOfOrder = Get.arguments['idOfOrder'];
    getOrderDetails();
    super.onInit();
  }

  @override
  getOrderDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await orederDetailsData.getData(token!, idOfOrder);
    print('response ===== $response');
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['message'] == 'success') {
        orderDetailsList.addAll(response['data']);
      }
      if (orderDetailsList.isEmpty) {
        Get.defaultDialog(title: 'Empty !', middleText: 'No Data Yet');
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  buyProductByPoints(idOfProductRes) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await buyProductByPointsData.getData(token!, idOfProductRes);
    print('response ===== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] ==
          'Your purchase has been completed successfully') {
        Get.snackbar(
          'Buy',
          'Buy Success',
        );
        Get.toNamed(AppRoutes.storeCategory);
        // orderDetailsList.addAll(response['data']);
      }
      if (response['message'] == 'No Point ُEnough') {
        Get.defaultDialog(title: 'Warning !', middleText: 'No Point ُEnough');
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
}
