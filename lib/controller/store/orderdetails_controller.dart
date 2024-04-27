import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/store/orderdetails_data.dart';

abstract class OrederDetailsController extends GetxController {
  getOrderDetails();
}

class OrederDetailsControllerImp extends OrederDetailsController {
  OrederDetailsData orederDetailsData = OrederDetailsData(Get.find());
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
}
