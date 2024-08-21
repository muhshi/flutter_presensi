import 'dart:io';

import 'package:dio/dio.dart';
import 'package:presensi/core/constant/constant.dart';
import 'package:presensi/core/helper/shared_preferences_helper.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // TODO: implement onRequest
    options.headers['accept'] = 'application/json';
    final authToken = await SharedPreferencesHelper.getString(PREF_AUTH);
    if (authToken?.isNotEmpty ?? false) {
      options.headers['Authorization'] = authToken;
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    if (response.statusCode != HttpStatus.ok) {
      return handler.resolve(Response(
          data: response.data, requestOptions: response.requestOptions));
    }
    super.onResponse(response, handler);
  }
}
