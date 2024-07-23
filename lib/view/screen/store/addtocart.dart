import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/store/addtocart_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/core/functions/validinput.dart';

class AddToCartPage extends StatelessWidget {
  const AddToCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddToCartControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.orangeAddToCartColor,
        // title: const Text(
        //   'Add To Cart Page',
        // ),
      ),
      body: GetBuilder<AddToCartControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Stack(
            fit: StackFit.expand,
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  AppImageAsset.backgroundAddToCard,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                bottom: 100,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(231, 0, 0, 0),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  height: 300,
                  width: 415,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Please Enter The Amount You Would Like To Order",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        height: 160,
                        width: 400,
                        child: Form(
                          key: controller.formState,
                          child: ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              TextFormField(
                                validator: (value) {
                                  return validInput(value!, 1, 100, 'number');
                                },
                                controller: controller.amount,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  label: const Text(
                                    "amount",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  hintStyle: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      color: AppColor.color,
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      color: AppColor.color,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              IconButton(
                                onPressed: () {
                                  controller.addToCart();
                                  print('Add to cart done');
                                },
                                icon: const Icon(
                                  Icons.send_rounded,
                                  color: AppColor.color,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// Container(
//             padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
//             child: Form(
//               key: controller.formState,
//               child: ListView(
//                 children: [
//                   // CustomTextFormAuth(
//                   //   isNumber: true,
//                   //   valid: (val) {
//                   //     return validInput(val!, 1, 100, 'number');
//                   //   },
//                   //   mycontroller: controller.orderId,
//                   //   hinttext: 'Order Id',
//                   //   labeltext: 'Oreder Id',
//                   //   iconData: Icons.numbers_outlined,
//                   // ),
//                   CustomTextFormAuth(
//                     isNumber: true,
//                     valid: (val) {
//                       return validInput(val!, 1, 100, 'number');
//                     },
//                     mycontroller: controller.amount,
//                     hinttext: 'Amount',
//                     labeltext: 'Amount',
//                     iconData: Icons.numbers_outlined,
//                   ),
//                   CustomButtonAuth(
//                     color: AppColor.primaryColor,
//                     text: 'Add',
//                     onPressed: () {
//                       controller.addToCart();
//                       print('Add to cart done');
//                     },
//                   ),
//                   // Text('${controller.productId}'),
//                 ],
//               ),
//             ),
//           ),