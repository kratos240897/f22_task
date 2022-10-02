import 'package:cached_network_image/cached_network_image.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../explore/views/explore_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: SafeArea(
          child: _gridImageView(),
        ));
  }

  Obx _gridImageView() {
    return Obx(() {
      return GridView.custom(
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: [
            const QuiltedGridTile(2, 2),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 2),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: controller.posts.length,
          (context, index) => GestureDetector(
            onTap: () => _onImageTapped(context, index),
            child: _imageWidget(index),
          ),
        ),
      );
    });
  }

  Hero _imageWidget(int index) {
    return Hero(
      tag: controller.posts[index].id,
      child: CachedNetworkImage(
        placeholder: (context, _) {
          return const CupertinoActivityIndicator();
        },
        imageUrl: controller.posts[index].src.medium,
        fit: BoxFit.fill,
      ),
    );
  }

  void _onImageTapped(BuildContext context, int index) {
    context.pushTransparentRoute(
        ExploreView(
          post: controller.posts[index],
        ),
        backgroundColor: Colors.black12);
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      title: Text(
        'Instagram',
        style: GoogleFonts.satisfy(
            letterSpacing: 1.2,
            color: Colors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
