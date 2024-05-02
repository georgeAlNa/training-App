import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/userinfo_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(UserInfoControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Info'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<UserInfoControllerImp>(
        builder: (controller) {
          return controller.info.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(10),
                    child: ListView(
                      children: [
                        Text(
                          'name : ${controller.nameofuser}\n',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Points : ${controller.pointsofuser}\n',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Current weight : ${controller.info[0]['Current_weight']}\n',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'age : ${controller.info[0]['age']}\n',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'height : ${controller.info[0]['height']}\n',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'gender : ${controller.info[0]['gender']}\n',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Calories : ${controller.info[0]['Calories']}\n',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'email : ${controller.emailofuser}\n',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
