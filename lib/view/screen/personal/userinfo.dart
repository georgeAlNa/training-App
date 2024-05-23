import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/personal/userinfo_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';
import 'package:training_app/view/widget/personal/customcarduserinfo.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(UserInfoControllerImp());
    return Scaffold1(
      title: 'Personal Info',
      body: Stack(
        children: [
          SizedBox(
            height: 50000,
            child: Image.asset(
              AppImageAsset.challeng,
              fit: BoxFit.fill,
            ),
          ),
          GetBuilder<UserInfoControllerImp>(
            builder: (controller) {
              return controller.info.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.color,
                      ),
                    )
                  : HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.all(1),
                        child: ListView(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            CustomCardUserInfo(
                              title: 'Email : ${controller.emailofuser}',
                              icon: Icons.email_outlined,
                            ),
                            CustomCardUserInfo(
                              title: 'Name : ${controller.nameofuser}',
                              icon: Icons.person_outline,
                            ),
                            CustomCardUserInfo(
                              title: 'Gender : ${controller.info[0]['gender']}',
                              icon: Icons.description_outlined,
                            ),
                            CustomCardUserInfo(
                              title: 'Age : ${controller.info[0]['age']}',
                              icon: Icons.numbers_outlined,
                            ),
                            CustomCardUserInfo(
                              title: 'Height : ${controller.info[0]['height']}',
                              icon: Icons.height_outlined,
                            ),
                            CustomCardUserInfo(
                              title:
                                  'Current Weight : ${controller.info[0]['Current_weight']}',
                              icon: Icons.monitor_weight_outlined,
                            ),
                            CustomCardUserInfo(
                              title:
                                  'Calories : ${controller.info[0]['Calories']}',
                              icon: Icons.calculate_outlined,
                            ),
                            CustomCardUserInfo(
                              title: 'Points : ${controller.pointsofuser}',
                              icon: Icons.attach_money_outlined,
                            ),
                          ],
                        ),
                      ),
                    );
            },
          )
        ],
      ),
    );
  }
}
