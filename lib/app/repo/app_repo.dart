import 'package:f22_task/app/data/models/post_response.dart';
import 'package:f22_task/app/helpers/endpoints.dart';
import 'package:flutter/foundation.dart';
import 'package:get/instance_manager.dart';
import '../service/api_service.dart';

class AppRepository {
  final ApiService _apiService = Get.find<ApiService>();

  Future<List<Photos>> getPhotos() async {
    try {
      final res = await _apiService
          .getRequest(Endpoints.photos, {'query': 'nature',
          'per_page': 40
          });
      final data = PostResponse.fromJson(res.data);
      return data.photos;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Future.error(e);
    }
  }
}
