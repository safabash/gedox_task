import 'dart:developer';

import 'package:dio/dio.dart';

import '../core/base_url.dart';
import '../model/model.dart';

class GetService {
  static Future<Model?> getService() async {
    final dio = Dio();

    try {
      final Response response = await dio.get(
        ApiBaseUrl.baseUrl,
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        return Model.fromJson(response.data);
      }
    } catch (e) {
      log(e.toString());
      // AppException.handleError(e, context);
    }
    return null;
  }
}
