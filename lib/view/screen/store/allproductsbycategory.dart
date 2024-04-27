import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/store/allproductsbycategory_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';

class StoreProductByCategoryPage extends StatelessWidget {
  const StoreProductByCategoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    StoreProductByCategoryControllerImp controller1 =
        Get.put(StoreProductByCategoryControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text('Products of Category ${controller1.idOfCat}'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<StoreProductByCategoryControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: controller.allProductByCategoryStoreList.length,
                itemBuilder: (context, index) {
                  return CustomButtonAuth(
                    color: AppColor.primaryColor,
                    text:
                        '${controller.allProductByCategoryStoreList[index]['name']}',
                    onPressed: () {
                      controller.goToProductDetails(index);
                      print('pro by cat');
                    },
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  mainAxisSpacing: 30,
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
