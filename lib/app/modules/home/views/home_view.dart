import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:kiit_archives/app/modules/home/views/pages/bookmark.dart';
import 'package:kiit_archives/app/modules/login/views/login_view.dart';

import '../controllers/home_controller.dart';
import 'pages/archives_page.dart';
import 'pages/downloads.dart';
import 'pages/home_page.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.tabList.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Home",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.account_circle_rounded, color: Colors.grey),
              onPressed: () {
                Get.to(LoginView());
              },
            ),
          ],
          elevation: 0,
        ),
        body: PageView(
          // controller: controller.tabController,
          physics: BouncingScrollPhysics(),
          children: [
            HomePage(),
            ArchivesPage(),
            BookmarkPage(),
            DownloadsPage(),
          ],
        ),
      ),
    );
  }
}
