import 'package:flutter/material.dart';
import 'package:training_app/core/class/statusrequest.dart';
import 'package:training_app/core/constant/color.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(
            child: CircularProgressIndicator(
            color: AppColor.primaryColor,
          ))
        : statusRequest == StatusRequest.offlinefailure
            ? const Center(
                child: Text(
                'Offline Failure',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ))
            : statusRequest == StatusRequest.serverfailure
                ? const Center(
                    child: Text(
                    'Server Failure',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
                : statusRequest == StatusRequest.failuer
                    ? const Center(
                        child: Text(
                        'No Data',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(
            child: CircularProgressIndicator(
            color: AppColor.primaryColor,
          ))
        : statusRequest == StatusRequest.offlinefailure
            ? const Center(
                child: Text(
                'Offline Failure',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ))
            : statusRequest == StatusRequest.serverfailure
                ? const Center(
                    child: Text(
                    'Server Failure',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
                : widget;
  }
}
