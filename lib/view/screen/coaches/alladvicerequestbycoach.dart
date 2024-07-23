import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/coaches/alladvicerequestbycoach_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/coaches/alladvicerequestbycoachwidget.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';

class AllAdviceRequestByCoachPage extends StatelessWidget {
  const AllAdviceRequestByCoachPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllAdviceRequestByCoachControllerImp());
    return Scaffold1(
      title: 'All Advice Request',
      body: Stack(
        children: [
          SizedBox(
            height: 5000,
            width: 5000,
            child: Image.asset(
              AppImageAsset.exercise,
              fit: BoxFit.fill,
            ),
          ),
          GetBuilder<AllAdviceRequestByCoachControllerImp>(
            builder: ((controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: controller.allAdviceRequestByCoachList.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColor.color,
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(1),
                          child: ListView(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .allAdviceRequestByCoachList.length,
                                itemBuilder: (context, index) {
                                  return CustomAllAdviceRequestByCoachWidget(
                                    title:
                                        'Trainer Id : ${controller.allAdviceRequestByCoachList[index]['trainer_id']}',
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                )),
          ),
        ],
      ),
    );
  }
}
