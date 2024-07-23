import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/store/productdetails_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';

class StoreProductDetailsPage extends StatelessWidget {
  const StoreProductDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(StoreProductDetailsControllerImp());
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Product Details'),
      //   backgroundColor: AppColor.primaryColor,
      // ),
      body: GetBuilder<StoreProductDetailsControllerImp>(
        builder: (controller) {
          return controller.productDetailsStoreList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.color,
                  ),
                )
              : HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImageAsset.backgroundStore),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 50, right: 90),
                          height: 300,
                          width: 250,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  controller.productDetailsStoreList[
                                      controller.idOfProduct]['image'],
                                ),
                                fit: BoxFit.fill),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(70),
                            border: Border.all(color: Colors.black, width: 3),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20, right: 100),
                          height: 80,
                          width: 250,
                          child: Text(
                            '${controller.productDetailsStoreList[controller.idOfProduct]['name']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              "Cost : ${controller.productDetailsStoreList[controller.idOfProduct]['cost']} \$ \n",
                              style: const TextStyle(
                                color: AppColor.whiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              "Point Cost : ${controller.productDetailsStoreList[controller.idOfProduct]['points_cost']}",
                              style: const TextStyle(
                                color: AppColor.whiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                controller.goToAddToCart();
                                print(
                                    'add to cart ${controller.idOfProductToAddToCart}');
                              },
                              icon: const Icon(
                                Icons.shopping_cart_checkout_outlined,
                                color: AppColor.color,
                                size: 32,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomButtonAuth(
                              text: "Go Back ",
                              onPressed: () {
                                Get.back();
                              },
                              color: AppColor.color,
                            ),
                          ],
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
// Container(
//                     padding: const EdgeInsets.all(10),
//                     child: ListView(
//                       children: [
//                         CustomTextTitleAuth(
//                           text:
//                               '${controller.productDetailsStoreList[controller.idOfProduct]['name']}\n',
//                         ),
//                         CustomTextBodyAuth(
//                           text:
//                               'Points Cost : ${controller.productDetailsStoreList[controller.idOfProduct]['points_cost']}\n Cost : ${controller.productDetailsStoreList[controller.idOfProduct]['cost']} \$',
//                         ),
//                         CustomTextBodyAuth(
//                           text:
//                               'id : ${controller.productDetailsStoreList[controller.idOfProduct]['id']}\n',
//                         ),
//                         Container(
//                             padding: const EdgeInsets.all(20),
//                             child: Image.network(
//                                 controller.productDetailsStoreList[
//                                     controller.idOfProduct]['image'])),

//                         const SizedBox(
//                           height: 130,
//                         ),

//                         CustomButtonAuth(
//                           color: AppColor.orangeColor,
//                           text: 'Add to Cart',
//                           onPressed: () {
//                             controller.goToAddToCart();
//                             print(
//                                 'add to cart ${controller.idOfProductToAddToCart}');
//                           },
//                         ),

//                         // CustomButtonAuth(
//                         //   color: AppColor.greenColor,
//                         //   text: 'Done',
//                         //   onPressed: () {
//                         //     controller.doneExercise();
//                         //     print('Done Exercise');
//                         //   },
//                         // ),
//                       ],
//                     ),
//                   ),