import 'package:flutter/material.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/screen/plans/planToBuildMusclesScreens/getallweeksbuild.dart';
import 'package:training_app/view/screen/plans/planToLossWeightScreens/getallweeksloss.dart';
import 'package:training_app/view/widget/container/Container3.dart';
import 'package:training_app/view/widget/container/Scaffold.dart';

class AllPlanPage extends StatelessWidget {
  const AllPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold1(
      title:'Plans',
      body: Container(
        padding: const EdgeInsets.all(1),
        child: Stack(
          children: [
            SizedBox(
              height: 50000,
              child: Image.asset(
                AppImageAsset.challeng,
                fit: BoxFit.fill,
              ),
            ),
            const Column(
              children: <Widget>[
                SizedBox(
                  height: 300,
                ),
                Container3(
                  text: "Plan to Build Muscles",
                  page: GetAllWeeksBuildPage(),
                ),
                Container3(
                  text: "Plan to Loss Weight",
                  page: GetAllWeeksLossPage(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
