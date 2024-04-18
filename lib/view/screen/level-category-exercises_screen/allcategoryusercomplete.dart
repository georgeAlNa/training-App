import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/level-category-exercises/allcategoryusercomplete_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/challenge/custombuttonchallengedetail.dart';

class AllCategoryCompletePage extends StatelessWidget {
  const AllCategoryCompletePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AllCategoryCompleteControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Category Complete'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<AllCategoryCompleteControllerImp>(
        builder: (controller) {
          return controller.completeCategory.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                      itemCount: controller.completeCategory.length,
                      itemBuilder: (context, index) {
                        return CustomButtonChallengeDetail(
                          textTitle:
                              'id of category complete: ${controller.completeCategory[index]['id']}',
                          color: AppColor.primaryColor,
                          textSubject:
                              'is done : ${controller.completeCategory[index]['is_done']}',
                          textDate:
                              'user id :${controller.completeCategory[index]['user_id']}',
                          onPressed: () {},
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
