import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/store/allcategorystore_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/store/custombuttonsearchstore.dart';
import 'package:training_app/view/widget/store/discountimage.dart';

class StoreCategoryPage extends StatelessWidget {
  const StoreCategoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(StoreCategoryControllerImp());
    return Scaffold(
      body: GetBuilder<StoreCategoryControllerImp>(
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(top: 25),
            height: double.infinity,
            width: double.infinity,
            color: Colors.black,
            child: ListView(
              children: [
                const Text(
                  " Welcome To Our Store",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.searchContent,
                          onChanged: (val) {
                            controller.checkSearch(val);
                          },
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              onPressed: () {
                                controller.onSearchItems();
                              },
                              icon: const Icon(
                                Icons.search_outlined,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                            hintText: "Find product",
                            hintStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColor.color,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            filled: true,
                            fillColor: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(
                            color: AppColor.color,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          onPressed: () {
                            controller.goToCart();
                            // Get.toNamed(AppRoute.orders);
                          },
                          icon: const Icon(
                            Icons.shopping_cart_checkout_outlined,
                            color: AppColor.color,
                            size: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: controller.isSearch
                      ? ListView.builder(
                          itemCount: controller.allProductsSearchList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CustomButtonSearchStore(
                              color: AppColor.primaryColor,
                              textImage:
                                  '${controller.allProductsSearchList[index]['image']}',
                              textTitle:
                                  '${controller.allProductsSearchList[index]['name']}\n',
                              textSubject:
                                  'Cost : ${controller.allProductsSearchList[index]['cost']} \$\n',
                              textDate:
                                  'Amount : ${controller.allProductsSearchList[index]['amount']}\n',
                              textVideo: '',
                              // 'Id : ${controller.allProductsSearchList[index]['id']}',
                              onPressed: () {
                                //controller.goToCategory(index + 1);
                                print('search');
                              },
                            );
                          },
                        )
                      : ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Container(
                              margin: const EdgeInsetsDirectional.symmetric(
                                horizontal: 15,
                                vertical: 15,
                              ),
                              child: const Stack(
                                children: [
                                  DiscountImage(),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 6),
                              child: const Text(
                                "  Categories",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            HandlingDataView(
                              statusRequest: controller.statusRequest,
                              widget: Container(
                                padding:
                                    const EdgeInsetsDirectional.only(start: 20),
                                height: 260,
                                width: 200,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      controller.allCategoryStoreList.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        controller
                                            .goToProductByCategory(index + 1);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(10),
                                            height: 150,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: AppColor.color,
                                                width: 4,
                                              ),
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadiusDirectional
                                                      .circular(30),
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                  '${controller.allImages[index]['image']}',
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            '${controller.allCategoryStoreList[index]['name']}',
                                            style: const TextStyle(
                                                fontSize: 17,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
                CustomButtonAuth(
                  text: 'Back To Home',
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.home);
                  },
                  color: AppColor.color,
                ),
              ],
            ),
          );
        },
      ),
    );

    //  Scaffold(
    //   body: GetBuilder<StoreCategoryControllerImp>(
    //     builder: (controller) {
    //       return Container(
    //         padding: const EdgeInsets.all(10),
    //         child: ListView(
    //           children: [
    //             Container(
    //               margin: const EdgeInsets.all(10),
    //               child: CustomAppBarStore(
    //                 mycontroller: controller.searchContent,
    //                 titleappbar: 'Find Product',
    //                 onPressedIconCart: () {
    //                   controller.goToCart();
    //                 },
    //                 onPressedSearch: () {
    //                   controller.onSearchItems();
    //                 },
    //                 onChanged: (val) {
    //                   controller.checkSearch(val);
    //                 },
    //               ),
    //             ),
    //             HandlingDataView(
    //               statusRequest: controller.statusRequest,
    //               widget: controller.isSearch
    //                   ? ListView.builder(
    //                       itemCount: controller.allProductsSearchList.length,
    //                       shrinkWrap: true,
    //                       physics: const NeverScrollableScrollPhysics(),
    //                       itemBuilder: (context, index) {
    //                         return CustomButtonSearch(
    //                           color: AppColor.primaryColor,
    //                           textTitle:
    //                               '${controller.allProductsSearchList[index]['name']}\n',
    //                           textSubject:
    //                               'Cost : ${controller.allProductsSearchList[index]['cost']} \$\n',
    //                           textDate:
    //                               'Amount : ${controller.allProductsSearchList[index]['amount']}\n',
    //                           textVideo:
    //                               'Id : ${controller.allProductsSearchList[index]['id']}',
    //                           onPressed: () {
    //                             //controller.goToCategory(index + 1);
    //                             print('search');
    //                           },
    //                         );
    //                       },
    //                     )
    //                   : Container(
    //                       padding: const EdgeInsets.all(10),
    //                       child: GridView.builder(
    //                         shrinkWrap: true,
    //                         physics: const NeverScrollableScrollPhysics(),
    //                         itemCount: controller.allCategoryStoreList.length,
    //                         itemBuilder: (context, index) {
    //                           return CustomButtonAuth(
    //                             color: AppColor.primaryColor,
    //                             text:
    //                                 '${controller.allCategoryStoreList[index]['name']}',
    //                             onPressed: () {
    //                               controller.goToProductByCategory(index + 1);
    //                               print('pro by cat');
    //                             },
    //                           );
    //                         },
    //                         gridDelegate:
    //                             const SliverGridDelegateWithFixedCrossAxisCount(
    //                           crossAxisCount: 2,
    //                           childAspectRatio: 1.3,
    //                           mainAxisSpacing: 30,
    //                           crossAxisSpacing: 15,
    //                         ),
    //                       ),
    //                     ),
    //             ),
    //             const SizedBox(
    //               height: 20,
    //             ),
    //             Container(
    //               color: AppColor.orangeColor,
    //               height: 40,
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   GestureDetector(
    //                     child: const Text(
    //                       'Back To Home',
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                     onTap: () => Get.offAllNamed(AppRoutes.home),
    //                   ),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
