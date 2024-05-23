import 'package:flutter/material.dart';
import 'package:training_app/core/constant/imageasset.dart';

class NotficationsPage extends StatelessWidget {
  const NotficationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          // RefreshIndicator(
          // child:
          ListView(),
          // onRefresh: () => ,
          // ),
        ],
      ),
    );
  }
}
