import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/store/allcategorystore_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';

class StoreCategoryPage extends StatelessWidget {
  const StoreCategoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(StoreCategoryControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Category'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<StoreCategoryControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: controller.allCategoryStoreList.length,
                itemBuilder: (context, index) {
                  return CustomButtonAuth(
                    color: AppColor.primaryColor,
                    text: '${controller.allCategoryStoreList[index]['name']}',
                    onPressed: () {
                      controller.goToProductByCategory(index + 1);
                      print('pro by cat');
                    },
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  mainAxisSpacing: 100,
                  crossAxisSpacing: 15,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
