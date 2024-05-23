import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/challenge/allchallenge_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/container/Container2.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';

class AllChallengePage extends StatelessWidget {
  const AllChallengePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AllChallengeControllerImp());
    return Scaffold1(
      title: 'Challenge',
      body: Container(
        padding: const EdgeInsets.all(1),
        child: Stack(
          children: [
            SizedBox(
              height: 50000,
              child: Image.asset(
                AppImageAsset.challeng,
                fit: BoxFit.fill,
              ),
            ),
            GetBuilder<AllChallengeControllerImp>(
              builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: RefreshIndicator(
                    color: AppColor.color,
                    onRefresh: () => controller.refreshPage(),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: ListView(
                        children: [
                          // const SizedBox(
                          //   width: 500,
                          //   child:
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'Enroll In The Challenge And Earn 100 Points \n \n',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColor.yellow100Color,
                                shadows: const [
                                  Shadow(
                                    blurRadius: 20,
                                    offset: Offset(1, 1),
                                    color: AppColor.color,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.allChallengeList.length,
                            itemBuilder: (context, index) {
                              return Container2(
                                title:
                                    '${controller.allChallengeList[index]['Challenge_name']}',
                                onTap: () {
                                  controller.goToChallengeDetail(index + 1);
                                  print('Challenge');
                                },
                              );
                            },
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
