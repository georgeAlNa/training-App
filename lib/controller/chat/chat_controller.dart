import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/data/datasource/remote/chat/chat_data.dart';
import 'package:training_app/data/model/gemini_chat_model.dart';
import 'package:training_app/linkapi.dart';

abstract class ChatController extends GetxController {
  sendMessage();
  chatWithGemini();
}

class ChatControllerImp extends ChatController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  ChatData chatData = ChatData(Get.find());
  late TextEditingController message;
  StatusRequest statusRequest = StatusRequest.none;
  final List<MessageModel> chat = [];
  final model =
      GenerativeModel(model: 'gemini-pro', apiKey: AppLink.geminiApiKey);

  @override
  void onInit() {
    message = TextEditingController();
    super.onInit();
  }

  @override
  Future<void> chatWithGemini() async {
    try {
      final messageContent = message.text;
      chat.add(
        MessageModel(
          isUser: true,
          message: messageContent,
          time: DateTime.now(),
        ),
      );
      update();
      final contenet = [Content.text(messageContent)];
      final response = await model.generateContent(contenet);
      chat.add(
        MessageModel(
          isUser: false,
          message: response.text ?? '',
          time: DateTime.now(),
        ),
      );
      update();
    } catch (e) {
      Get.defaultDialog(
        title: 'Warning!',
        middleText: e.toString(),
      );
    }
  }

  @override
  sendMessage() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

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
