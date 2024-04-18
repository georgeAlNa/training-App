import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/level-category-exercises/category_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(CategoryControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<CategoryControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: controller.category.length,
                itemBuilder: (context, index) {
                  return CustomButtonAuth(
                   // pathImage: '${controller.category[index]['image']}',
                    color: AppColor.primaryColor,
                    text: '${controller.category[index]['name']}',
                    onPressed: () {
                      controller.goToExercises(index + 1, controller.idOfLevel);
                      print('category');
                    },
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
