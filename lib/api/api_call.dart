import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:icm/api/url.dart';
import 'package:icm/model/Facility.dart';
import 'package:icm/utils/constant_function.dart';

import '../main.dart';

class ApiCall {
  static final Dio _dio = Dio();
  static final ApiCall _instance = ApiCall._internal();

  factory ApiCall() {
    return _instance;
  }

  ApiCall._internal() {
    _dio.options.baseUrl = baseUrl;
    _dio.interceptors.add(MyApp.alice.getDioInterceptor());
  }

  //Login
  Future<dynamic> checkLogin(String userName, String password, String token,
      String latitude, String longtitude) async {
    try {
      var params = {
        "UserName": userName,
        "Password": password,
        "MobileToken": token,
        "Latitude": latitude,
        "Longitude": longtitude
      };

      log(jsonEncode(params));

      final response = await _dio.post(loginUrl, data: params);
      log('response code ${response.requestOptions.path} ${response.statusCode} $params ${response.data}');
      return response.data;
    } on DioError catch (e) {
      toast(e.response?.data['RtnMessage'] ?? e.message);
    } catch (e) {
      log(e.toString());
      toast(null);
    }
    return null;
  }

  //Get dashboard details
  Future<dynamic> getDashboardDetails(int empId) async {
    try {
      var params = {
        "EmployeeID": empId,
      };
      final response = await _dio.get(dashboardUrl, queryParameters: params);
      log('response code ${response.requestOptions.path} ${response.statusCode} ${response.data}');

      return response.data;
    } on DioError catch (e) {
      toast(e.response?.data['RtnMessage'] ?? e.message);
    } catch (e) {
      log(e.toString());
      toast(null);
    }
    return null;
  }

  //Get details by facility
  Future<Facility?> getDetailsByFacility(int empId, int facilityId) async {
    try {
      var params = {
        "EmployeeID": empId,
        "FacilityID": facilityId
      };
      final response = await _dio.get(detailsByFacilityurl, queryParameters: params);
      log('response code ${response.requestOptions.path} ${response.statusCode} ${response.data}');

      return Facility.fromJson(response.data);
    } on DioError catch (e) {
      toast(e.response?.data['RtnMessage'] ?? e.message);
    } catch (e) {
      log(e.toString());
      toast(null);
    }
    return null;
  }
}
