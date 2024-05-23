import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/coaches/getallcoaches_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/container/Container2.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';

class AllCoachesPage extends StatelessWidget {
  const AllCoachesPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AllCoachesControllerImp());
    return Scaffold1(
      title: 'All Coaches',
      body: Stack(
        children: [
          SizedBox(
            height: 50000,
            child: Image.asset(
              AppImageAsset.challeng,
              fit: BoxFit.fill,
            ),
          ),
          GetBuilder<AllCoachesControllerImp>(
            builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(1),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: controller.allCoachesMap.length,
                        itemBuilder: (context, index) {
                          return Container2(
                            title:
                                '${controller.allCoachesMap['${index + 1}']['name']}',
                            onTap: () {
                              controller.goToAdviceCreateByCoach(index + 1);
                              print('advice');
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
