import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/store/updatepaymentstatebyadmin_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';

class UpdatePaymentStateByAdminPage extends StatelessWidget {
  const UpdatePaymentStateByAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UpdatePaymentStateByAdminControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Payment State'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<UpdatePaymentStateByAdminControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustomTextFormAuth(
                    hinttext: 'Order Id',
                    labeltext: 'Order Id For Update Payment State',
                    iconData: Icons.label_important_outline,
                    mycontroller: controller.orderId,
                    valid: (value) {
                      return validInput(value!, 1, 100, 'number');
                    },
                    isNumber: true,
                  ),
                  CustomButtonAuth(
                    text: 'Update',
                    color: AppColor.primaryColor,
                    onPressed: () {
                      controller.updatePayment();
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
