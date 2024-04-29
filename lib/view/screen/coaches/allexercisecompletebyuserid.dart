import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/coaches/allexercisecompletebyuserid_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';
import 'package:training_app/view/widget/challenge/custombuttonchallengedetail.dart';

class AllExerciseCompleteByUserIdPage extends StatelessWidget {
  const AllExerciseCompleteByUserIdPage({super.key});
  // dynamic vertificate;

  @override
  Widget build(BuildContext context) {
    Get.put(AllExerciseCompleteByUserIdControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        title: const Text(
          'All Exercise Complete By User Id',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GetBuilder<AllExerciseCompleteByUserIdControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: controller.isComplete
              ? Container(
                  padding: const EdgeInsets.all(15),
                  child: ListView.builder(
                    itemCount:
                        controller.allExerciseUserCompleteByIdList.length,
                    itemBuilder: (context, index) {
                      return CustomButtonChallengeDetail(
                        textTitle:
                            'Name of Exercise: ${controller.allExerciseUserCompleteByIdList[index]['exercise_name']}',
                        color: AppColor.primaryColor,
                        textSubject: '',
                        //'is done : ${controller.completeExerciseList[index]['is_done']}',
                        textDate:
                            'user id :${controller.allExerciseUserCompleteByIdList[index]['user_id']}',
                        onPressed: () {},
                      );
                    },
                  ),
                )
              : Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        CustomTextFormAuth(
                          isNumber: true,
                          mycontroller: controller.userId,
                          valid: (value) {
                            return validInput(value!, 1, 4, 'number');
                          },
                          hinttext: 'User Id',
                          labeltext: 'Enter User Id',
                          iconData: Icons.numbers_outlined,
                        ),
                        CustomButtonAuth(
                          color: AppColor.primaryColor,
                          text: 'Submit',
                          onPressed: () {
                            controller.allExerciseComplete();
                            print('exercise complete');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
