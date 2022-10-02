import 'package:f22_task/app/data/models/post_response.dart';
import 'package:f22_task/app/repo/app_repo.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList<Photos> posts = RxList.empty();
  final _repo = Get.find<AppRepository>();

  @override
  void onReady() async {
    await _repo.getPhotos().then((value) {
      posts.value = value;
    }).onError((error, _) {});
    super.onReady();
  }
}
