import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/store/orederincart_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/store/custombuttonorderincart.dart';

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
              child: controller.allOrdersList.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.primaryColor,
                      ),
                    )
                  : ListView(
                      // itemCount: controller.allOrdersList.length,
                      // itemBuilder: (context, index) {
                      // return
                      children: [
                        CustomButtonOrderInCart(
                          // pathImage: '${controller.category[index]['image']}',
                          color: AppColor.primaryColor,
                          text: 'Order -> ${controller.allOrdersList[0]['id']}',
                          onPressed: () {
                            controller.goToOrderDetails(1);
                            print('order details');
                          },
                          onLongPress: () {},
                        ),
                      ],
                      // },
                    ),
            ),
          );
        },
      ),
    );
  }
}
