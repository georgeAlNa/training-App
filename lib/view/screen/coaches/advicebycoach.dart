import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/coaches/advicebycoach_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';
import 'package:training_app/view/widget/star.dart';

class AdviceByCoachPage extends StatelessWidget {
  const AdviceByCoachPage({super.key});
  @override
  Widget build(BuildContext context) {
    AdviceByCoachControllerImp controller1 =
        Get.put(AdviceByCoachControllerImp());
    return Scaffold1(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller1.askForAdvice();
        },
        backgroundColor: AppColor.color,
        child: const Icon(
          Icons.add,
          color: AppColor.blackColor,
        ),
      ),
      title: 'Advice By Coach',
      body: GetBuilder<AdviceByCoachControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Stack(
              children: [
                SizedBox(
                  height: 50000,
                  child: Image.asset(
                    AppImageAsset.challeng,
                    fit: BoxFit.fill,
                  ),
                ),
                RefreshIndicator(
                  color: AppColor.color,
                  onRefresh: () => controller1.refreshPage(),
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    child: ListView.builder(
                      itemCount: controller.adviceByCoachList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            ListTile(
                              onTap: () {
                                controller.goToRateAdvice(index + 1);
                                print('advice');
                              },
                              title: Text(
                                '${controller.adviceByCoachList[index]['message']}',
                                style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: const Star(),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
// CustomButtonAuth(
//                     color: AppColor.primaryColor,
//                     text: '${controller.adviceByCoachList[index]['message']}',
//                     onPressed: () {
//                       controller.goToRateAdvice(index + 1);
//                       print('advice');
//                     },
//                   );