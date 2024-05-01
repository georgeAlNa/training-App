import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/store/updatepaymentstatebyadmin_data.dart';

abstract class UpdatePaymentStateByAdminController extends GetxController {
  updatePayment();
}

class UpdatePaymentStateByAdminControllerImp
    extends UpdatePaymentStateByAdminController {
  UpdatePaymentStateByAdminData updatePaymentStateByAdminData =
      UpdatePaymentStateByAdminData(Get.find());
  MyService myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController orderId;
  String? token;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('tokenAdmin');
    orderId = TextEditingController();
    super.onInit();
  }

  @override
  updatePayment() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await updatePaymentStateByAdminData.getData(token!, orderId.text);
      print('response ===== $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'successfully') {
          Get.defaultDialog(title: 'Done', middleText: 'Update Payment State');
        }
      } else {
        Get.defaultDialog(
            title: 'warning', middleText: 'Not Update Payment State');
        statusRequest = StatusRequest.failuer;
      }
      update();
      print('valid');
    } else {
      print('not valid');
    }
  }

  @override
  void dispose() {
    orderId.dispose();
    super.dispose();
  }
}
