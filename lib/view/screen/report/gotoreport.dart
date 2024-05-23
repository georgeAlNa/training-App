import 'package:flutter/material.dart';
import 'package:training_app/core/constant/imageasset.dart';
import 'package:training_app/view/screen/report/reportexercise/allreportexercise.dart';
import 'package:training_app/view/screen/report/reportporgress/allreportprogress.dart';
import 'package:training_app/view/screen/report/reportstroe/allreportstore.dart';
import 'package:training_app/view/widget/container/Container3.dart';

class AllReportsPage extends StatelessWidget {
  const AllReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  height: 200,
                ),
                Container3(
                  text: "Progress Report",
                  page: AllReportProgressPage(),
                ),
                Container3(
                  text: "Exercise Report",
                  page: AllReportExercisePage(),
                ),
                Container3(
                  text: "Store Report",
                  page: AllReportStorePage(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
