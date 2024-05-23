import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/coaches/rateadvice_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';
import 'package:training_app/view/widget/rate/customradiolisttile.dart';

class RateAdvicePage extends StatelessWidget {
  const RateAdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RateAdviceControllerImp());
    return Scaffold1(
      title: 'Rate Advice',
      body: GetBuilder<RateAdviceControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomRadioListTile(
                    activeColor: AppColor.blackColor,
                    tileColor: AppColor.redColor,
                    title: const Text(
                      'Bad',
                      style: TextStyle(
                        color: AppColor.blackColor,
                      ),
                    ),
                    value: 0,
                    groupValue: controller.idOfRate,
                    onChanged: (val) {
                      controller.update();
                      controller.idOfRate = val;
                      print(val);
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomRadioListTile(
                    activeColor: AppColor.blackColor,
                    tileColor: AppColor.orangeColor,
                    title: const Text(
                      'Mid',
                      style: TextStyle(
                        color: AppColor.blackColor,
                      ),
                    ),
                    value: 1,
                    groupValue: controller.idOfRate,
                    onChanged: (val) {
                      controller.update();
                      controller.idOfRate = val;
                      print(val);
                    },
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  CustomRadioListTile(
                    activeColor: AppColor.blackColor,
                    tileColor: AppColor.primaryColor,
                    title: const Text(
                      'Good',
                      style: TextStyle(
                        color: AppColor.blackColor,
                      ),
                    ),
                    value: 2,
                    groupValue: controller.idOfRate,
                    onChanged: (val) {
                      controller.update();
                      controller.idOfRate = val;
                      print(val);
                    },
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  CustomRadioListTile(
                    activeColor: AppColor.blackColor,
                    tileColor: AppColor.greenColor,
                    title: const Text(
                      'Excellent',
                      style: TextStyle(
                        color: AppColor.blackColor,
                      ),
                    ),
                    value: 3,
                    groupValue: controller.idOfRate,
                    onChanged: (val) {
                      controller.update();
                      controller.idOfRate = val;
                      print(val);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButtonAuth(
                    color: AppColor.yellow100Color,
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
