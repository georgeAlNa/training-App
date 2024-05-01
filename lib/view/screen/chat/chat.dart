import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/chat/chat_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/custombuttonauth.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ask Chat GPT'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<ChatControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustomTextFormAuth(
                    hinttext: 'Enter Your Question',
                    labeltext: 'Question',
                    iconData: Icons.question_answer_outlined,
                    mycontroller: controller.message,
                    valid: (value) {
                      return validInput(value!, 1, 200, 'message');
                    },
                    isNumber: false,
                  ),

                  CustomButtonAuth(
                    text: 'Ask',
                    color: AppColor.primaryColor,
                    onPressed: () {
                      controller.sendMessage();
                    },
                  ),
                  // Text('${controller.token}'),
                  // Text('${controller.age}'),
                  // Text('${controller.currentWeight}'),
                  // Text('${controller.height}'),
                  // Text('${controller.gender}'),
                  //Text('${controller.targetWeight}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
