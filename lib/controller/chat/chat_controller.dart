import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/data/datasource/remote/chat/chat_data.dart';

abstract class ChatController extends GetxController {
  sendMessage();
}

class ChatControllerImp extends ChatController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  ChatData chatData = ChatData(Get.find());
  late TextEditingController message;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    message = TextEditingController();
    super.onInit();
  }

  @override
  sendMessage() async {
    statusRequest = StatusRequest.loading;
    update();
    if (formState.currentState!.validate()) {
      var response = chatData.postData(message.text);
      print('response ===== $response');
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == 'success') {
          Get.defaultDialog(
              title: 'Answer From Chat AI: ',
              middleText: '${response['data']}');
        } else {
          Get.defaultDialog(
              title: 'warning', middleText: 'Not Valid Message Send Again');
          statusRequest = StatusRequest.failuer;
        }
      } else {
        Get.defaultDialog(
            title: 'warning', middleText: 'Not Valid Message Send Again');
        statusRequest = StatusRequest.failuer;
      }
      update();
      print('valid');
    } else {
      print('not valid');
    }
  }

  @override
  void dispose() {
    message.dispose();
    super.dispose();
  }
}
