import 'dart:convert';
import 'package:flutter_base/util/base_view_model/status_enum.dart';
import 'package:http/http.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  bool? success;
  List? errors;
  ApiResponse({this.data, this.message, this.success, this.errors});
  ApiResponse.loading(this.message) : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.message) : status = Status.ERROR;
  @override
  String toString() {
    return "Success : $success\nMessage : $message\nData : $data";
  }
}

ApiResponse returnResponse(Response response) {
  print(response.statusCode);
  var responseJson = json.decode(response.body);
  switch (response.statusCode) {
    case 200:
    case 201:
    case 202:
    case 204:
      return ApiResponse(success: true, message: "", data: responseJson);
    case 400:
      String? msg = responseJson["message"];
      if (msg == "") {
        msg = responseJson["error"];
      }
      return ApiResponse(success: false, message: msg, data: null);
    case 401:
    case 403:
      return ApiResponse(
          success: false, message: responseJson["message"], data: null);
    case 415:
      return ApiResponse(
          success: false, message: responseJson["error"], data: null);
    case 500:
    case 501:
    case 502:
    case 503:
    case 504:
      return ApiResponse(
          success: false,
          message:
              "Apologies, someone forgot to fix a bug, rest assured, we will get to bottom of this",
          data: null);
    default:
      return ApiResponse(
          success: false, message: responseJson["message"], data: null);
  }
}

ApiResponse returnError<T>(String response) {
  var responseJson = json.decode(response);
  return ApiResponse<T>(
      data: null, errors: [], message: responseJson["message"], success: false);
}
