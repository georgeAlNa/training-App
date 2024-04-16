import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/level-category-exercises/allcategoryusercomplete_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';

class AllCategoryCompletePage extends StatelessWidget {
  const AllCategoryCompletePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AllCategoryCompleteControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Category Complete'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<AllCategoryCompleteControllerImp>(
        builder: (controller) {
          return controller.completeCategory.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                      itemCount: controller.completeCategory.length,
                      itemBuilder: (context, index) {
                        return Text(
                          '\n all : ${controller.completeCategory[index]}\n',
                        );
                      },
                    ),
                  ),
                );
        },
      ),
    );
  }
}
