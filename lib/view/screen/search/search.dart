import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/controller/search/search_controller.dart';
import 'package:training_app/core/class/handlingdataview.dart';
import 'package:training_app/core/constant/color.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';
import 'package:training_app/view/widget/customsearchbar.dart';
import 'package:training_app/view/widget/search/custombuttonsearch.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchControllerImp());
    return Scaffold1(
      title: 'Search',
      body: Container(
        margin: const EdgeInsets.all(1),
        child: Stack(
          children: [
            SizedBox(
              height: 50000,
              child: Image.asset(
                AppImageAsset.challeng,
                fit: BoxFit.fill,
              ),
            ),
            GetBuilder<SearchControllerImp>(
              builder: (controller) {
                return ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: CustomSearchBar(
                        mycontroller: controller.searchContent,
                        titleappbar: 'Find Exercise',
                        // onPressedIconFavorite: () {
                        //   // Get.toNamed(AppRoutes.getAllFavorites);
                        // },
                        onPressedSearch: () {
                          controller.onSearchItems();
                        },
                        onChanged: (val) {
                          controller.checkSearch(val);
                        },
                      ),
                    ),
                    HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: controller.isSearch
                          ? ListView.builder(
                              itemCount: controller.searchList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CustomButtonSearch(
                                  color: AppColor.color,
                                  textTitle:
                                      '${controller.searchList[index]['name']}\n',
                                  textSubject:
                                      '${controller.searchList[index]['description']}\n',
                                  textDate:
                                      'Timer : ${controller.searchList[index]['date']} s\n',
                                  textVideo: '',
                                  // 'Id : ${controller.searchList[index]['id']}',
                                  onPressed: () {
                                    controller.goToExerciseDetailSearch(index);
                                    print('exercise detail');
                                  },
                                );
                              },
                            )
                          : Container(),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
