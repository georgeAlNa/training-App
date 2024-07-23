import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/store/orderdetails_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/store/customcart.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OrederDetailsControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Details',
          style: TextStyle(
            color: AppColor.blackColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: AppColor.orangeAddToCartColor,
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              AppImageAsset.backgroundStore,
              fit: BoxFit.fitHeight,
            ),
          ),
          GetBuilder<OrederDetailsControllerImp>(
            builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.all(1),
                  child: ListView.builder(
                    itemCount: controller.orderDetailsList.length,
                    itemBuilder: (context, index) {
                      return CustomButtonCart(
                        textTitle:
                            '\n${controller.orderDetailsList[index]['name']}\n',
                        textCost:
                            '     Cost : ${controller.orderDetailsList[index]['cost']} \$ \n\n Point Cost : ${controller.orderDetailsList[index]['points_cost']}\n',
                        textAmount:
                            'Amount : ${controller.orderDetailsList[index]['amount']}\n',
                        textId: '',
                        // 'Id : ${controller.orderDetailsList[index]['id']}\n',
                        imagePath:
                            '${controller.orderDetailsList[index]['image']}',
                        color: AppColor.black54Color,
                        onPressedIconBuy: () {
                          Get.defaultDialog(
                            title: 'Buy Product',
                            middleText: 'Sure Want Buy Product ?',
                            onConfirm: () {
                              controller.buyProductByPoints(
                                  controller.orderDetailsList[index]['id']);
                              print('Buy Success');
                            },
                            onCancel: () {
                              Get.back();
                            },
                            cancelTextColor: AppColor.blackColor,
                            confirmTextColor: AppColor.blackColor,
                          );
                        },
                        onPressed: () {},
                        onLongPress: () {},
                        onPressedIconDelete: () {
                          Get.defaultDialog(
                            title: 'Delete',
                            middleText: 'Sure Want Delete Order ?',
                            onConfirm: () {
                              controller.deleteOreder(
                                  controller.orderDetailsList[index]['id'], 1);
                              Get.snackbar(
                                'Delete',
                                'Delete Success',
                              );
                              print('Delete Success');
                            },
                            onCancel: () {
                              Get.back();
                            },
                            cancelTextColor: AppColor.blackColor,
                            confirmTextColor: AppColor.blackColor,
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
