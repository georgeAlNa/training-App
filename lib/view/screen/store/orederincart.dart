import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/store/orederincart_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';

class OrdersInCartPage extends StatelessWidget {
  const OrdersInCartPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OredersInCartControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blackColor,
        title: Text(
          "My Orders",
          style: TextStyle(
            fontSize: 22,
            color: AppColor.yellow100Color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                AppImageAsset.backgroundAddOrders,
                fit: BoxFit.fitHeight,
              ),
            ),
            GetBuilder<OredersInCartControllerImp>(
              builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Positioned(
                    bottom: 0,
                    child: controller.allOrdersList.isEmpty
                        ? const CircularProgressIndicator(
                            color: AppColor.color,
                          )
                        : Container(
                            height: 400,
                            width: 430,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                topRight: Radius.circular(100),
                              ),
                            ),
                            padding: const EdgeInsets.all(20),
                            child: ListView(
                              // itemCount: controller.allOrdersList.length,
                              //  itemBuilder: (context, index) {
                              //return
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.goToOrderDetails(1);
                                    print('order details');
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.only(
                                      left: 4,
                                      right: 4,
                                    ),
                                    height: 70,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          141, 255, 208, 0),
                                      borderRadius:
                                          BorderRadiusDirectional.circular(40),
                                      border: Border.all(
                                        color: AppColor.color,
                                        width: 3,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: const Icon(
                                            Icons
                                                .shopping_cart_checkout_outlined,
                                            color: AppColor.color,
                                            size: 40,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        const Text(
                                          'Orders',
                                          // ${controller.allOrdersList[0]['id']}
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
// Scaffold(
//       appBar: AppBar(
//         title: const Text('Orders'),
//         backgroundColor: AppColor.primaryColor,
//       ),
//       body: GetBuilder<OredersInCartControllerImp>(
//         builder: (controller) {
//           return HandlingDataView(
//             statusRequest: controller.statusRequest,
//             widget: Container(
//               padding: const EdgeInsets.all(10),
//               child: controller.allOrdersList.isEmpty
//                   ? const Center(
//                       child: CircularProgressIndicator(
//                         color: AppColor.primaryColor,
//                       ),
//                     )
//                   : ListView(
//                       // itemCount: controller.allOrdersList.length,
//                       // itemBuilder: (context, index) {
//                       // return
//                       children: [
//                         CustomButtonOrderInCart(
//                           // pathImage: '${controller.category[index]['image']}',
//                           color: AppColor.primaryColor,
//                           text: 'Order -> ${controller.allOrdersList[0]['id']}',
//                           onPressed: () {
//                             controller.goToOrderDetails(1);
//                             print('order details');
//                           },
//                           onLongPress: () {},
//                         ),
//                       ],
//                       // },
//                     ),
//             ),
//           );
//         },
//       ),
//     );