import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/favorite/allfavorite_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/container/Container2.dart';

class AllFavoritePage extends StatelessWidget {
  const AllFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllFavoriteControllerImp());
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 5000,
            child: Image.asset(
              AppImageAsset.sport,
              fit: BoxFit.fill,
            ),
          ),
          GetBuilder<AllFavoriteControllerImp>(
            builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: RefreshIndicator(
                  color: AppColor.color,
                  onRefresh: () => controller.refreshPage(),
                  child: Container(
                    height: 1000,
                    padding: const EdgeInsets.all(1),
                    child: ListView.builder(
                      // reverse: true,
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: controller.allFavoriteList.length,
                      itemBuilder: (context, index) {
                        return Container2(
                          // color: AppColor.primaryColor,
                          title:
                              'Exercise Name: ${controller.allFavoriteList[index]}',
                          onTap: () {
                            Get.defaultDialog(
                              title: 'Delete',
                              middleText: 'Sure Want Delete From Favorite ?',
                              onConfirm: () {
                                controller.getDeleteFromFavoriteData(index);
                                Get.snackbar(
                                  'Deleted',
                                  'Deleted Success',
                                );
                                print('deleted');
                              },
                              onCancel: () {
                                Get.back();
                              },
                              cancelTextColor: AppColor.blackColor,
                              confirmTextColor: AppColor.blackColor,
                            );
                            print('done');
                          },
                        );
                      },
                    ),
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
//                       
