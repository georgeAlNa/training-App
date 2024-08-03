import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:training_app/controller/chat/chat_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
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
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.chat.length,
                      itemBuilder: (context, index) {
                        final message = controller.chat[index];
                        return listOfMessage(
                          isUser: message.isUser,
                          message: message.message,
                          time: message.time,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomTextFormAuth(
                      hinttext: 'Enter Your Question',
                      labeltext: 'Question',
                      iconData: Icons.send,
                      mycontroller: controller.message,
                      valid: (value) {
                        return validInput(value!, 1, 200, 'message');
                      },
                      isNumber: false,
                      onTapIcon: () {
                        controller.chatWithGemini();
                        controller.message.clear();
                      },
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

Widget listOfMessage({
  required bool isUser,
  required String message,
  required DateTime time,
}) {
  return Align(
    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isUser ? Colors.yellow : Colors.grey[300],
        borderRadius: isUser
            ? const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
      ),
      child: Column(
        children: [
          Text(
            message,
            style: TextStyle(
              color: AppColor.blackColor,
              fontWeight: isUser ? FontWeight.bold : FontWeight.normal,
              fontSize: 18,
            ),
          ),
          Text(
            DateFormat('hh:mm a').format(time),
            style: const TextStyle(
              color: AppColor.blackColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    ),
  );
}


// children: [
                      //   CustomTextFormAuth(
                      //     hinttext: 'Enter Your Question',
                      //     labeltext: 'Question',
                      //     iconData: Icons.send,
                      //     mycontroller: controller.message,
                      //     valid: (value) {
                      //       return validInput(value!, 1, 200, 'message');
                      //     },
                      //     isNumber: false,
                      //     onTapIcon: () {
                      //       controller.sendMessage();
                      //     },
                      //   ),

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
                      // ],