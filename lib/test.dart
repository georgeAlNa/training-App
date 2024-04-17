import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/test_controller.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: GetBuilder<TestController>(
        builder: (controller) => Center(
          child: CustomButtonAuth(
            text: 'done',
            color: AppColor.greenColor,
            onPressed: () {
              // controller.doneExercise();
            },
          ),
        ),
      ),
    );
  }
}
