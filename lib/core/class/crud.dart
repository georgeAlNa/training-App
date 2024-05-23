import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:training_app/core/class/statusrequest.dart';
// import 'package:training_app/core/functions/checkinternet.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postMethod({
    required String linkurl,
    @required Map? data,
    @required String? token,
  }) async {
    try {
      // if (await checkInternet()) {
        Map<String, String> headers = {};
        if (token != null) {
          headers.addAll({'Authorization': 'Bearer $token'});
        }
        print(
            'body =  $data  token = $token  url = $linkurl header = $headers');

        var response =
            await http.post(Uri.parse(linkurl), body: data, headers: headers );
        print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      // } else {
      //   return const Left(StatusRequest.offlinefailure);
      // }
    } catch (e) {
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> getMethod({
    required String linkurl,
    @required String? token,
  }) async {
    try {
      // if (await checkInternet()) {
        Map<String, String> headers = {};
        if (token != null) {
          headers.addAll({'Authorization': 'Bearer $token'});
        }
        print('token = $token  url = $linkurl header = $headers');

        var response = await http.get(Uri.parse(linkurl), headers: headers);
        print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      // } else {
      //   return const Left(StatusRequest.offlinefailure);
      // }
    } catch (e) {
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> putMethod({
    required String linkurl,
    @required Map? data,
    @required String? token,
  }) async {
    try {
      // if (await checkInternet()) {
        Map<String, String> headers = {};
        if (token != null) {
          headers.addAll({'Authorization': 'Bearer $token'});
        }
        print(
            'body =  $data  token = $token  url = $linkurl header = $headers');

        var response =
            await http.put(Uri.parse(linkurl), body: data, headers: headers);
        print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      // } else {
      //   return const Left(StatusRequest.offlinefailure);
      // }
    } catch (e) {
      return const Left(StatusRequest.serverException);
    }
  }
}
