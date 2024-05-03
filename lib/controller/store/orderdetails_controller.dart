import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/store/buyproduct.dart';
import 'package:training_app/data/datasource/remote/store/deleteorder_data.dart';
import 'package:training_app/data/datasource/remote/store/orderdetails_data.dart';

abstract class OrederDetailsController extends GetxController {
  getOrderDetails();
  buyProductByPoints(dynamic idOfProductRes);
  deleteOreder(dynamic idOfProduct, dynamic idOfOrderForDelete);
}

class OrederDetailsControllerImp extends OrederDetailsController {
  OrederDetailsData orederDetailsData = OrederDetailsData(Get.find());
  DeleteOrderData deleteOrderData = DeleteOrderData(Get.find());

  BuyProductByPointsData buyProductByPointsData =
      BuyProductByPointsData(Get.find());
  MyService myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List orderDetailsList = [];
  String? token;
  dynamic idOfOrder;
  dynamic idOFUser;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    idOFUser = myService.sharedPreferences.getInt('id');
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
        Get.defaultDialog(title: 'Empty !', middleText: 'No Products Yet');
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  buyProductByPoints(idOfProductRes) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await buyProductByPointsData.getData(token!, idOfProductRes, idOFUser);
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

  @override
  deleteOreder(idOfProduct, idOfOrderForDelete) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await deleteOrderData.getDeleteData(
        token!, idOfProduct, idOfOrderForDelete);
    print('response ===== $response');
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['message1'] == 'success') {
        Get.defaultDialog(
            title: 'Success', middleText: 'Deleted Product Success');
        Get.offAllNamed(AppRoutes.storeCategory);
      } else {
        Get.defaultDialog(title: 'Error !', middleText: 'Error In delete');
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
}
