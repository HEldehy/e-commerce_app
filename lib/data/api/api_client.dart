import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import '../../constance/app_constance.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String apiBaseUrl;
  late Map<String, String> _mainHelper;
  ApiClient({required this.apiBaseUrl}) {
    baseUrl = apiBaseUrl;
    timeout = Duration(seconds: 30);
    token=AppConstants.TOKEN;
    _mainHelper = {
      'Content-Type': 'application/json;charSet=UTF-8',
      'Authorization': 'Bearer $token',
    };

  }
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
