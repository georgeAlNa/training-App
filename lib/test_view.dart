import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/test_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('test'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<TestController>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Center(child: Text('${controller.data}'));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
