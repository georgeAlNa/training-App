import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/store/addtocart_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';

class AddToCartPage extends StatelessWidget {
  const AddToCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddToCartControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          'Add To Cart Page',
        ),
      ),
      body: GetBuilder<AddToCartControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustomTextFormAuth(
                    isNumber: true,
                    valid: (val) {
                      return validInput(val!, 1, 100, 'number');
                    },
                    mycontroller: controller.orderId,
                    hinttext: 'Order Id',
                    labeltext: 'Oreder Id',
                    iconData: Icons.numbers_outlined,
                  ),
                  CustomTextFormAuth(
                    isNumber: true,
                    valid: (val) {
                      return validInput(val!, 1, 100, 'number');
                    },
                    mycontroller: controller.amount,
                    hinttext: 'Amount',
                    labeltext: 'Amount',
                    iconData: Icons.numbers_outlined,
                  ),
                  CustomButtonAuth(
                    color: AppColor.primaryColor,
                    text: 'Add',
                    onPressed: () {
                      controller.addToCart();
                      print('Add to cart done');
                    },
                  ),
                  // Text('${controller.productId}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
