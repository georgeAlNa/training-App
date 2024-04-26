import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/store/addtocart_data.dart';

abstract class AddToCartController extends GetxController {
  addToCart();
}

class AddToCartControllerImp extends AddToCartController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController orderId;
  late TextEditingController amount;
  StatusRequest statusRequest = StatusRequest.none;
  AddToCartData addToCartData = AddToCartData(Get.find());
  MyService myService = Get.find();
  String? token;
  dynamic productId;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    orderId = TextEditingController();
    amount = TextEditingController();
    productId = Get.arguments['proId'];
    super.onInit();
  }

  @override
  addToCart() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addToCartData.postData(
          token!, productId.toString(), orderId.toString(), amount.toString());
      print('response ===== $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'success') {
          print('object');
          Get.defaultDialog(title: 'Done', middleText: 'Done Add To Cart');
        }
      } else {
        Get.defaultDialog(title: 'warning', middleText: 'Not add To Cart');
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
    amount.dispose();
    super.dispose();
  }
}
