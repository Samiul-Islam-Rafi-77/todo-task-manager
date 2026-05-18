// lib/services/network_caller.dart
import 'dart:convert';
import 'package:http/http.dart';
import 'package:task_manager/data/model/network_response.dart';
import 'package:task_manager/ui/utility/app_constants.dart';


class NetworkCaller {
  // GET Request
  static Future<NetworkResponse> getRequest(String url) async {
    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedData,
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  // Registration এর জন্য বিশেষ GET Request with Query Parameters
  static Future<NetworkResponse> registrationGetRequest({
    required String email,
    required String firstName,
    required String lastName,
    required String mobile,
    required String password,
  }) async {
    // URL এ Query Parameters যোগ করা
    String url = '${AppConstants.baseUrl}/registration'
        '?email=${Uri.encodeComponent(email)}'
        '&firstName=${Uri.encodeComponent(firstName)}'
        '&lastName=${Uri.encodeComponent(lastName)}'
        '&mobile=${Uri.encodeComponent(mobile)}'
        '&password=${Uri.encodeComponent(password)}'
        '&photo=';
    
    return await getRequest(url);
  }

  static Future<NetworkResponse> postRequest(String registration, {required Map<String, dynamic> body}) async {
    try {
      Response response = await post(
        Uri.parse(registration),
      );
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedData,
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }
}