import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/search/search_data.dart';

// ______________ all of this iam used in home controller so this file not use in application just for know _________________

abstract class SearchController extends GetxController {
  getSearchData();
  goToExerciseDetailSearch(dynamic idOfExerciseSearch);
}

class SearchControllerImp extends SearchController {
  SearchData searchData = SearchData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List searchList = [];
  MyService myService = Get.find();
  String? token;
  bool isSearch = false;
  late TextEditingController searchContent;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    searchContent = TextEditingController();
    // getSearchData();
    super.onInit();
  }

  @override
  getSearchData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await searchData.getData(token!, searchContent.text);
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
  goToExerciseDetailSearch(idOfExerciseSearch) {
    Get.toNamed(
      AppRoutes.getExerciseByIdSearch,
      // arguments: {
      //   'idOfExe': idOfExerciseSearch,
      // },
    );
    myService.sharedPreferences.setInt(
        'idExerciseFromResponseSearch', searchList[idOfExerciseSearch]['id']);
  }

  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    getSearchData();
    update();
  }

  @override
  void dispose() {
    searchContent.dispose();
    super.dispose();
  }
}
