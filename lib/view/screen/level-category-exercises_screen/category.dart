import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/level-category-exercises/category_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';
import 'package:training_app/view/widget/level%20+%20category%20+%20eercise/custombuttoncategory.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(CategoryControllerImp());
    return Scaffold1(
      title: 'Categories',
      body: GetBuilder<CategoryControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(1),
              child: ListView.builder(
                itemCount: controller.category.length,
                itemBuilder: (context, index) {
                  return CustomButtonCategory(
                    imagePath: '${controller.imageOfCategory[index]['image']}',
                    categoryName: '${controller.category[index]['name']}',
                    onTap: () {
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
