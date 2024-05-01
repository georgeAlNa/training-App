import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/store/addproductbyadmin_data.dart';

abstract class AddProductByAdminController extends GetxController {
  addProduct();
}

class AddProductByAdminControllerImp extends AddProductByAdminController {
  AddProductByAdminData addProductByAdminData =
      AddProductByAdminData(Get.find());
  MyService myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController nameProduct;
  late TextEditingController imageProduct;
  late TextEditingController costProduct;
  late TextEditingController amountProduct;
  late TextEditingController categoryIdProduct;
  late TextEditingController pointsCostProduct;
  String? token;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('tokenAdmin');
    nameProduct = TextEditingController();
    imageProduct = TextEditingController();
    costProduct = TextEditingController();
    amountProduct = TextEditingController();
    categoryIdProduct = TextEditingController();
    pointsCostProduct = TextEditingController();
    super.onInit();
  }

  @override
  addProduct() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addProductByAdminData.postData(
          token!,
          nameProduct.text,
          imageProduct.text,
          costProduct.text,
          amountProduct.text,
          categoryIdProduct.text,
          pointsCostProduct.text);
      print('response ===== $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'Product add successfully') {
          Get.defaultDialog(title: 'Done', middleText: 'Done Add Product');
        }
      } else {
        Get.defaultDialog(title: 'warning', middleText: 'Not add Product');
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
    nameProduct.dispose();
    imageProduct.dispose();
    costProduct.dispose();
    amountProduct.dispose();
    categoryIdProduct.dispose();
    pointsCostProduct.dispose();
    super.dispose();
  }
}
