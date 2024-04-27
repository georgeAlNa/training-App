import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/store/orederincart_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';

class OrdersInCartPage extends StatelessWidget {
  const OrdersInCartPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OredersInCartControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<OredersInCartControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: controller.allOrdersList.length,
                itemBuilder: (context, index) {
                  return CustomButtonAuth(
                    // pathImage: '${controller.category[index]['image']}',
                    color: AppColor.primaryColor,
                    text: 'Order -> ${controller.allOrdersList[index]['id']}',
                    onPressed: () {
                      controller.goToOrderDetails(index + 1);
                      print('order details');
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
