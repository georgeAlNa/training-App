import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/store/deleteorder_data.dart';
import 'package:training_app/data/datasource/remote/store/orederincart_data.dart';

abstract class OredersInCartController extends GetxController {
  getAllOrdersForUser();
  goToOrderDetails(dynamic idOfOrder);
  // deleteOreder(dynamic idOfOrderForDelete);
}

class OredersInCartControllerImp extends OredersInCartController {
  OredersInCartData oredersInCartData = OredersInCartData(Get.find());
  DeleteOrderData deleteOrderData = DeleteOrderData(Get.find());
  MyService myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List allOrdersList = [];
  String? token;
  dynamic idOfUser;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    idOfUser = myService.sharedPreferences.getInt('id');
    getAllOrdersForUser();
    super.onInit();
  }

  @override
  getAllOrdersForUser() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await oredersInCartData.getData(token!, idOfUser);
    print('response ===== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        allOrdersList.addAll(response['order']);
      } else {
        Get.defaultDialog(title: 'Empty !', middleText: 'No Oreders Yet');
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  goToOrderDetails(idOfOrder) {
    Get.toNamed(AppRoutes.storeOrederDetails, arguments: {
      'idOfOrder': idOfOrder,
    });
  }

  // @override
  // deleteOreder(idOfOrderForDelete) async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response =
  //       await deleteOrderData.getDeleteData(token!, idOfOrderForDelete);
  //   print('response ===== $response');
  //   statusRequest = handlingData(response);
  //   if (statusRequest == StatusRequest.success) {
  //     if (response['message'] == 'Order Delete Successfully') {
  //       Get.defaultDialog(
  //           title: 'Success', middleText: 'Deleted Order Success');
  //       Get.offAllNamed(AppRoutes.storeCategory);
  //     } else {
  //       Get.defaultDialog(title: 'Error !', middleText: 'Error In delete');
  //       statusRequest = StatusRequest.failuer;
  //     }
  //   }
  //   update();
  //   // else {
  //   //   Get.defaultDialog(title: 'Error 1!', middleText: 'Error In delete');
  //   //   statusRequest = StatusRequest.failuer;
  //   // }
  //   // update();
  // }
}
