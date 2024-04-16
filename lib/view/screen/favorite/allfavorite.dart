import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/favorite/allfavorite_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';

class AllFavoritePage extends StatelessWidget {
  const AllFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllFavoriteControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Favorites'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<AllFavoriteControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: controller.allFavoriteList.length,
                itemBuilder: (context, index) {
                  return CustomButtomAuth(
                    color: AppColor.primaryColor,
                    text:
                        'id of exercise : ${controller.allFavoriteList[index]['exercise_id']}',
                    onPressed: () {
                      print('done');
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