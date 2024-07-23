import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/core/constant/routes_name.dart';
import 'package:training_app/core/functions/handlingdatacontroller.dart';
import 'package:training_app/core/services/services.dart';
import 'package:training_app/data/datasource/remote/store/allcategorystore_data.dart';
import 'package:training_app/data/datasource/remote/store/searchstore_data.dart';

abstract class StoreCategoryController extends GetxController {
  getCategory();
  goToProductByCategory(dynamic idOfCategoryStore);
  getSearchData();
  goToCart();
}

class StoreCategoryControllerImp extends StoreCategoryController {
  StoreCategoryData storeCategoryData = StoreCategoryData(Get.find());
  StoreSearchData storeSearchData = StoreSearchData(Get.find());
  MyService myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List allCategoryStoreList = [];
  List allProductsSearchList = [];
  List allImages = [
    {
      'image': AppImageAsset.sportsCategory,
    },
    {
      'image': AppImageAsset.shoesCategory,
    },
    {
      'image': AppImageAsset.equCategory,
    },
  ];

  String? token;
  bool isSearch = false;
  late TextEditingController searchContent;

  @override
  void onInit() {
    token = myService.sharedPreferences.getString('token');
    searchContent = TextEditingController();
    getCategory();
    super.onInit();
  }

  @override
  getCategory() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await storeCategoryData.getData(token!);
    print('response ===== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        allCategoryStoreList.addAll(response['data']);
      } else {
        Get.defaultDialog(title: 'Empty !', middleText: 'No Category Yet');
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  goToProductByCategory(idOfCategoryStore) {
    Get.toNamed(AppRoutes.storeProductByCategory, arguments: {
      'idOfCategoryStore': idOfCategoryStore,
    });
  }

  @override
  getSearchData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await storeSearchData.getData(token!, searchContent.text);
    print('response ==== $response');
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == 'success') {
        allProductsSearchList.clear();
        allProductsSearchList.addAll(response['product']);
      }
      if (allProductsSearchList.isEmpty) {
        Get.defaultDialog(
          title: 'Not Found',
          middleText:
              'Try Again With Existing Items Or Correct the name of Item',
        );
        // statusRequest = StatusRequest.serverfailure;
      }
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

  @override
  goToCart() {
    Get.toNamed(AppRoutes.storeGetAllOrders);
  }
}
