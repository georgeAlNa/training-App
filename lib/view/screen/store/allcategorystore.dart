import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/store/allcategorystore_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/customappbarstore.dart';
import 'package:training_app/view/widget/search/custombuttonsearch.dart';

class StoreCategoryPage extends StatelessWidget {
  const StoreCategoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(StoreCategoryControllerImp());
    return Scaffold(
      body: GetBuilder<StoreCategoryControllerImp>(
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: CustomAppBarStore(
                    mycontroller: controller.searchContent,
                    titleappbar: 'Find Product',
                    onPressedIconCart: () {
                      controller.goToCart();
                    },
                    onPressedSearch: () {
                      controller.onSearchItems();
                    },
                    onChanged: (val) {
                      controller.checkSearch(val);
                    },
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
                            return CustomButtonSearch(
                              color: AppColor.primaryColor,
                              textTitle:
                                  '${controller.allProductsSearchList[index]['name']}\n',
                              textSubject:
                                  'Cost : ${controller.allProductsSearchList[index]['cost']} \$\n',
                              textDate:
                                  'Amount : ${controller.allProductsSearchList[index]['amount']}\n',
                              textVideo:
                                  'Id : ${controller.allProductsSearchList[index]['id']}',
                              onPressed: () {
                                //controller.goToCategory(index + 1);
                                print('search');
                              },
                            );
                          },
                        )
                      : Container(
                          padding: const EdgeInsets.all(10),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.allCategoryStoreList.length,
                            itemBuilder: (context, index) {
                              return CustomButtonAuth(
                                color: AppColor.primaryColor,
                                text:
                                    '${controller.allCategoryStoreList[index]['name']}',
                                onPressed: () {
                                  controller.goToProductByCategory(index + 1);
                                  print('pro by cat');
                                },
                              );
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.3,
                              mainAxisSpacing: 30,
                              crossAxisSpacing: 15,
                            ),
                          ),
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: AppColor.orangeColor,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: const Text(
                          'Back To Home',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () => Get.offAllNamed(AppRoutes.home),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
