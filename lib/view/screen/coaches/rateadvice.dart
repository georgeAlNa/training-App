import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/coaches/rateadvice_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/rate/customradiolisttile.dart';

class RateAdvicePage extends StatelessWidget {
  const RateAdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RateAdviceControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate Advice'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<RateAdviceControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomRadioListTile(
                    activeColor: AppColor.blackColor,
                    tileColor: AppColor.yellowColor,
                    title: const Text('Bad'),
                    value: 0,
                    groupValue: controller.idOfRate,
                    onChanged: (val) {
                      controller.update();
                      controller.idOfRate = val;
                      print(val);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomRadioListTile(
                    activeColor: AppColor.blackColor,
                    tileColor: AppColor.orangeColor,
                    title: const Text('Mid'),
                    value: 1,
                    groupValue: controller.idOfRate,
                    onChanged: (val) {
                      controller.update();
                      controller.idOfRate = val;
                      print(val);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomRadioListTile(
                    activeColor: AppColor.blackColor,
                    tileColor: AppColor.primaryColor,
                    title: const Text('Good'),
                    value: 2,
                    groupValue: controller.idOfRate,
                    onChanged: (val) {
                      controller.update();
                      controller.idOfRate = val;
                      print(val);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomRadioListTile(
                    activeColor: AppColor.blackColor,
                    tileColor: AppColor.greenColor,
                    title: const Text('Excellent'),
                    value: 3,
                    groupValue: controller.idOfRate,
                    onChanged: (val) {
                      controller.update();
                      controller.idOfRate = val;
                      print(val);
                    },
                  ),
                  CustomButtomAuth(
                    color: AppColor.primaryColor,
                    text: 'Rate',
                    onPressed: () {
                      controller.rateAdvice(controller.idOfRate);
                      print('rate');
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
