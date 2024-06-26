import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/search/search_data.dart';
import 'package:training_app/view/screen/challenge%20+%20plan%20+%20chat.dart';
import 'package:training_app/view/screen/favorite/allfavorite.dart';
import 'package:training_app/view/screen/level-category-exercises_screen/level.dart';
import 'package:training_app/view/screen/notfications.dart';
import 'package:training_app/view/screen/personal/allitemsinpersonal.dart';
import 'package:training_app/view/screen/report/gotoreport.dart';

abstract class HomeController extends GetxController {
  initialData();
  logOut();
  getSearchData();
}

class HomeControllerImp extends HomeController {
  List<Widget> listWidget = [
    const LevelPage(),
    const ChallengeAndPlanAndChat(),
    const AllFavoritePage(),
    const AllReportsPage(),
    const NotficationsPage(),
    const AllItemsInPersonalPage(),
  ];
  SearchData searchData = SearchData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();
  late TextEditingController searchContent;
  List searchList = [];
  String? name;
  String? email;
  String? token;
  String? userName;
  String? userEmail;
  bool isSearch = false;
  int selectedindex = 0;

  @override
  initialData() {
    name = myService.sharedPreferences.getString('name');
    email = myService.sharedPreferences.getString('email');
    token = myService.sharedPreferences.getString('token');
    searchContent = TextEditingController();
  }

  @override
  void onInit() {
    initialData();
    // userName = Get.arguments['name'];
    //userEmail = Get.arguments['email'];
    super.onInit();
  }

  @override
  logOut() {
    myService.sharedPreferences.remove('stepLogin');
    myService.sharedPreferences.remove('name');
    myService.sharedPreferences.remove('email');
    myService.sharedPreferences.remove('token');
    Get.offAllNamed(AppRoutes.login);
    print('${name}');
    print('${email}');
    print('${token}');
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
        searchList.clear();
        searchList.addAll(response['Exercise']);
      }
    } else {
      Get.defaultDialog(
        title: 'Not Found',
        middleText:
            'Try Again With Existing Exercise Or Correct the name of Exercise',
      );
      statusRequest = StatusRequest.serverfailure;
    }
    update();
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
}
