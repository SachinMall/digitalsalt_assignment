import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:digitalsalt_assignment/data/app_execution.dart';
import 'package:digitalsalt_assignment/data/network/base_api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  static var client = http.Client();

  @override
  Future<dynamic> getGetApiResponse(String url) async {
    log(" url: $url");
    // Map<String, String> header = {};    //! for token to use in the header
    // String token = await userPreference.getAuthToken();
    // if (url.contains('generateotp') || url.contains('verifyotp')) {
    //   header = {'Content-Type': 'application/json'};
    // } else {
    //   header = {
    //     'Content-Type': 'application/json',
    //     'Authorization': 'Bearer $token'
    //   };
    // }
    dynamic responseJson;
    try {
      final response =
          await client.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      if (kDebugMode) {
        log("status code::${response.statusCode}");
      }

      if (response.statusCode == 200) {
        responseJson = jsonDecode(response.body);
        log("✅ Response::=> ${json.encode(responseJson)}");
        return responseJson;
      } else if (response.statusCode == 403) {
        log('🚫 Error: $url ::=> StatusCode:: ${response.statusCode}');
        return responseJson;
      } else {
        log('🚫 Error: $url ::=> StatusCode:: ${response.statusCode}');
        return responseJson;
      }
    } on SocketException {
      throw FetchDataExceptions('No Internet Connection');
    } on TimeoutException {
      throw TimeOutExceptions('');
    }
  }

  @override
  Future getPostApiResponse(payload, String url) async {
    dynamic jsonResponse;
    Map<String, String> header = {'Content-Type': 'application/json'};
    // String token = await userPreference.getAuthToken(); //! for token to use in the header
    // if (url.contains('generateotp') || url.contains('verifyotp')) {
    //   header = {'Content-Type': 'application/json'};
    // } else {
    //   header = {
    //     'Content-Type': 'application/json',
    //     'Authorization': 'Bearer $token'
    //   };
    // }

    log('🔗 URL::=>  $url \n 👀header:: ${json.encode(header)}');
    log('📦 Payload ::=> ${json.encode(payload)}');
    try {
      final response = await client.post(Uri.parse(url),
          body: json.encode(payload), headers: header);

      if (kDebugMode) {
        log("status code::${response.statusCode}");
      }

      if (response.statusCode == 200) {
        jsonResponse = jsonDecode(response.body);
        log("✅ Response::=> ${json.encode(jsonResponse)}");
        return jsonResponse;
      } else if (response.statusCode == 403) {
        log('🚫 Error: $url ::=> StatusCode:: ${response.statusCode}');
        return jsonResponse;
      } else {
        log('🚫 Error: $url ::=> StatusCode:: ${response.statusCode}');
        return jsonResponse;
      }
    } catch (e, stackTrace) {
      log(
        '🚫 Error:  $url  , Exception:: $e  \n::=> StackTrace::=> $stackTrace',
      );
      return jsonResponse;
    }
  }

//! alternate option to throw the error from the api
  // dynamic returnResponse(http.Response response) {
  //   switch (response.statusCode) {
  //     case 200:
  //       dynamic responseJson = jsonDecode(response.body);
  //       return responseJson;
  //     case 400:
  //       throw BadRequestException(response.body.toString());
  //     case 404:
  //       throw UnAuthorisedException(response.body.toString());
  //     case 500:
  //     default:
  //       throw FetchDataExceptions(
  //           'Error occured while communicating with the server' +
  //               'with status code' +
  //               response.statusCode.toString());
  //   }
  // }
}