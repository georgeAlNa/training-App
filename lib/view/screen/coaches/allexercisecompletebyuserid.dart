import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/coaches/allexercisecompletebyuserid_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';
import 'package:training_app/view/widget/challenge/custombuttonchallengedetail.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';

class AllExerciseCompleteByUserIdPage extends StatelessWidget {
  const AllExerciseCompleteByUserIdPage({super.key});
  // dynamic vertificate;

  @override
  Widget build(BuildContext context) {
    Get.put(AllExerciseCompleteByUserIdControllerImp());
    return Scaffold1(
      title: 'All Exercise Complete \n By User Id',
      // appBar: AppBar(
      //   backgroundColor: AppColor.primaryColor,
      //   elevation: 0.0,
      //   title: const Text(
      //     'All Exercise Complete By User Id',
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
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
          GetBuilder<AllExerciseCompleteByUserIdControllerImp>(
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
                                '\n\n\n Name of Exercise: ${controller.allExerciseUserCompleteByIdList[index]['exercise_name']}\n\n',
                            color: AppColor.color,
                            textSubject: '',
                            //'is done : ${controller.completeExerciseList[index]['is_done']}',
                            textDate:
                                '\n\n user id :${controller.allExerciseUserCompleteByIdList[index]['user_id']}\n\n',
                            onPressed: () {},
                          );
                        },
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
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
                              color: AppColor.color,
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
        ],
      ),
    );
  }
}
