import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/store/addproductbyadmin_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddProductByAdminControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<AddProductByAdminControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustomTextFormAuth(
                    hinttext: 'Name',
                    labeltext: 'Name Product',
                    iconData: Icons.label_important_outline,
                    mycontroller: controller.nameProduct,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'message');
                    },
                    isNumber: false,
                  ),
                  CustomTextFormAuth(
                    hinttext: 'Image URL From Network',
                    labeltext: 'Image URL',
                    iconData: Icons.image_outlined,
                    mycontroller: controller.imageProduct,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'url');
                    },
                    isNumber: false,
                  ),
                  CustomTextFormAuth(
                    hinttext: 'Cost Product',
                    labeltext: 'Cost Product',
                    iconData: Icons.price_check_outlined,
                    mycontroller: controller.costProduct,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    isNumber: true,
                  ),
                  CustomTextFormAuth(
                    hinttext: 'Amount Product',
                    labeltext: 'Amount Product',
                    iconData: Icons.numbers_outlined,
                    mycontroller: controller.amountProduct,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    isNumber: true,
                  ),
                  CustomTextFormAuth(
                    hinttext: 'Category Id',
                    labeltext: 'Category Id',
                    iconData: Icons.numbers_outlined,
                    mycontroller: controller.categoryIdProduct,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    isNumber: true,
                  ),
                  CustomTextFormAuth(
                    hinttext: 'Point Cost Of Product',
                    labeltext: 'Point Cost Of Product',
                    iconData: Icons.price_check_outlined,
                    mycontroller: controller.pointsCostProduct,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    isNumber: true,
                  ),
                  CustomButtonAuth(
                    text: 'Add',
                    color: AppColor.primaryColor,
                    onPressed: () {
                      controller.addProduct();
                    },
                  ),
                  //Text('${controller.token}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
