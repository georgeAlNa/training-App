import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/chat/chat_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/core/functions/validinput.dart';
import 'package:training_app/view/widget/auth/customtextformauth.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatControllerImp());
    return Scaffold1(
      title: 'Chat',
      body: GetBuilder<ChatControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Stack(
            children: [
              SizedBox(
                height: 5000,
                width: 5000,
                child: Image.asset(
                  AppImageAsset.sport,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Form(
                      key: controller.formState,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          CustomTextFormAuth(
                            hinttext: 'Enter Your Question',
                            labeltext: 'Question',
                            iconData: Icons.send,
                            mycontroller: controller.message,
                            valid: (value) {
                              return validInput(value!, 1, 200, 'message');
                            },
                            isNumber: false,
                            onTapIcon: () {
                              controller.sendMessage();
                            },
                          ),

                          // CustomButtonAuth(
                          //   text: 'Ask',
                          //   color: AppColor.color,
                          //   onPressed: () {
                          //     controller.sendMessage();
                          //   },
                          // ),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
