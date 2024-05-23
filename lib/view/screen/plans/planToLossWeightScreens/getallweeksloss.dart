import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/plans/planToLossWeightController/getallweeksloss_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';

class GetAllWeeksLossPage extends StatelessWidget {
  const GetAllWeeksLossPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(GetAllWeeksLossControllerImp());
    return Scaffold1(
      title: 'Loss',
      body: Container(
        padding: const EdgeInsets.all(1),
        child: Stack(
          children: [
            SizedBox(
              height: 5000,
              child: Image.asset(
                AppImageAsset.sport,
                fit: BoxFit.fill,
              ),
            ),
            GetBuilder<GetAllWeeksLossControllerImp>(
              builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Column(
                    children: [
                      const SizedBox(
                        height: 200,
                      ),
                      Center(
                        child: Text(
                          "4 Weeks To Loss Weight",
                          style: TextStyle(
                            color: AppColor.yellow100Color,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 20,
                            childAspectRatio: 1.0,
                            crossAxisSpacing: 20,
                            mainAxisExtent: 70,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.allWeeksLossList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                controller.goToWeekDetails(index + 1);
                                print('go To Week Details');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColor.color,
                                    width: 3,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(40000),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '${controller.allWeeksLossList[index]['name']}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      // IconButton(
                      //     onPressed: () {
                      //       Get.to(const Reblace());
                      //     },
                      //     icon: const Icon(
                      //       Icons.edit,
                      //       color: color,
                      //       size: 50,
                      //     ))
                    ],
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
