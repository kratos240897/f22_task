import 'package:cached_network_image/cached_network_image.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:f22_task/app/data/models/post_response.dart';
import 'package:f22_task/app/helpers/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  final Photos post;
  const ExploreView({required this.post, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
        onDismissed: () => Get.back(),
        minRadius: 25.0,
        minScale: 0.25,
        direction: DismissiblePageDismissDirection.multi,
        isFullScreen: true,
        child: Scaffold(
          appBar: _appBar(),
          body: Column(
            children: [_postHeader(), _postImage(), vSpace(12.0), _actions()],
          ),
        ));
  }

  Padding _actions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          const Icon(FontAwesomeIcons.heart),
          hSpace(15.0),
          const Icon(FontAwesomeIcons.comment),
          hSpace(15.0),
          const Icon(Icons.send),
          const Spacer(),
          const Icon(
            FontAwesomeIcons.bookmark,
          )
        ],
      ),
    );
  }

  SizedBox _postImage() {
    return SizedBox(
      height: Get.height * 0.4,
      child: Hero(
        tag: post.id,
        child: CachedNetworkImage(
          placeholder: (context, _) {
            return const CupertinoActivityIndicator();
          },
          fit: BoxFit.fill,
          imageUrl: post.src.original,
        ),
      ),
    );
  }

  Padding _postHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 12.0, bottom: 12.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(post.src.tiny),
          ),
          hSpace(8.0),
          Text(
            post.photographer,
            style: GoogleFonts.leagueSpartan(
                fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          ElevatedButton(onPressed: () {}, child: const Text('Follow')),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz_rounded,
              ))
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          CupertinoIcons.back,
          color: Colors.black,
        ),
        onPressed: () => Get.back(),
      ),
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        'Explore',
        style: GoogleFonts.poppins(
            color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}
