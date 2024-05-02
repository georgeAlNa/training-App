import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/report/reportexercise/getexercisebyid_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/view/widget/auth/customtextbodyauth.dart';
import 'package:training_app/view/widget/auth/customtexttitleauth.dart';

class GetExerciseByIdReportPage extends StatelessWidget {
  const GetExerciseByIdReportPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(GetExerciseByIdReportControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Detail By id'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<GetExerciseByIdReportControllerImp>(
        builder: (controller) {
          return controller.exerciseByIdReportList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(15),
                    child: ListView(
                      children: [
                        CustomTextTitleAuth(
                          text:
                              '${controller.exerciseByIdReportList[0]['name']}\n',
                        ),
                        CustomTextBodyAuth(
                          text:
                              '${controller.exerciseByIdReportList[0]['description']}\n',
                        ),
                        CustomTextBodyAuth(
                          text:
                              'id : ${controller.exerciseByIdReportList[0]['id']}\n',
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: GestureDetector(
                            child: Text(
                              '${controller.exerciseByIdReportList[0]['video']}\n',
                            ),
                            onTap: () {},
                          ),
                        ),
                        CustomTextBodyAuth(
                          text:
                              'Date : ${controller.exerciseByIdReportList[0]['date']}\n',
                        ),
                        const SizedBox(
                          height: 300,
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
