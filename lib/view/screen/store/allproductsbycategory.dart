import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/store/allproductsbycategory_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';

class StoreProductByCategoryPage extends StatelessWidget {
  const StoreProductByCategoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    // StoreProductByCategoryControllerImp controller1 =
    Get.put(StoreProductByCategoryControllerImp());
    return Scaffold(
      appBar: AppBar(
        // title: Text('Products of Category ${controller1.idOfCat}'),
        backgroundColor: AppColor.color,
        title: const Icon(
          Icons.accessibility_new_outlined,
          size: 45,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<StoreProductByCategoryControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(1),
              child: ListView.builder(
                itemCount: controller.allProductByCategoryStoreList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColor.color,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 159,
                          width: 130,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(15),
                            border: Border.all(
                              color: AppColor.color,
                              width: 2,
                            ),
                            color: AppColor.color,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                '${controller.allProductByCategoryStoreList[index]['image']}',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 40),
                          height: 150,
                          width: 160,
                          child: Text(
                            '${controller.allProductByCategoryStoreList[index]['name']}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${controller.allProductByCategoryStoreList[index]['cost']} \$',
                              style: const TextStyle(
                                fontSize: 18,
                                color: AppColor.color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.goToProductDetails(index);
                              },
                              icon: const Icon(
                                Icons.visibility_outlined,
                                size: 35,
                                color: AppColor.color,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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
// GridView.builder(
//                 itemCount: controller.allProductByCategoryStoreList.length,
//                 itemBuilder: (context, index) {
//                   return CustomButtonAuth(
//                     color: AppColor.primaryColor,
//                     text:
//                         '${controller.allProductByCategoryStoreList[index]['name']}',
//                     onPressed: () {
//                       controller.goToProductDetails(index);
//                       print('pro by cat');
//                     },
//                   );
//                 },
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 1.3,
//                   mainAxisSpacing: 30,
//                   crossAxisSpacing: 15,
//                 ),
//               ),