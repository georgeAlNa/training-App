import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/store/productdetails_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/customtextbodyauth.dart';
import 'package:training_app/view/widget/auth/customtexttitleauth.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';

class StoreProductDetailsPage extends StatelessWidget {
  const StoreProductDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(StoreProductDetailsControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<StoreProductDetailsControllerImp>(
        builder: (controller) {
          return controller.productDetailsStoreList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(10),
                    child: ListView(
                      children: [
                        CustomTextTitleAuth(
                          text:
                              '${controller.productDetailsStoreList[controller.idOfProduct]['name']}\n',
                        ),
                        CustomTextBodyAuth(
                          text:
                              'cost : ${controller.productDetailsStoreList[controller.idOfProduct]['cost']} \$',
                        ),
                        CustomTextBodyAuth(
                          text:
                              'id : ${controller.productDetailsStoreList[controller.idOfProduct]['id']}\n',
                        ),
                        Container(
                            padding: const EdgeInsets.all(20),
                            child: Image.network(
                                controller.productDetailsStoreList[
                                    controller.idOfProduct]['image'])),

                        const SizedBox(
                          height: 130,
                        ),

                        CustomButtonAuth(
                          color: AppColor.orangeColor,
                          text: 'Add to Cart',
                          onPressed: () {
                            controller.goToAddToCart();
                            print('add to cart ${controller.idOfProductToAddToCart}');
                          },
                        ),

                        // CustomButtonAuth(
                        //   color: AppColor.greenColor,
                        //   text: 'Done',
                        //   onPressed: () {
                        //     controller.doneExercise();
                        //     print('Done Exercise');
                        //   },
                        // ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
