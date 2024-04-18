import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/search/search_data.dart';


// ______________ all of this iam used in home controller so this file not use in application just for know _________________



abstract class SearchController extends GetxController {
  getSearchData();
}

class SearchControllerImp extends SearchController {
  SearchData searchData = SearchData(Get.find());
  late StatusRequest statusRequest;
  List searchList = [];
  MyService myService = Get.find();
  String? token;
  late TextEditingController searchContent;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    searchContent = TextEditingController();
    getSearchData();
    super.onInit();
  }

  @override
  getSearchData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await searchData.getData(token!, searchContent);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        searchList.addAll(response['Exercise']);
      } else {
        Get.defaultDialog(
          title: 'Not Found',
          middleText:
              'Try Again With Existing Exercise Or Correct the name of Exercise',
        );
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  void dispose() {
    searchContent.dispose();
    super.dispose();
  }
}
