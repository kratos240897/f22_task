import 'package:f22_task/app/data/models/post_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modules/explore/bindings/explore_binding.dart';
import '../modules/explore/views/explore_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import 'routes.dart';

class PageRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.HOME:
        return GetPageRoute(
            routeName: Routes.HOME,
            page: () => const HomeView(),
            binding: HomeBinding());
      case Routes.EXPLORE:
        return GetPageRoute(
            routeName: Routes.EXPLORE,
            page: () => ExploreView(post: args as Photos),
            binding: ExploreBinding());
    }
    return null;
  }
}
