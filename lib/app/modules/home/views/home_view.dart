import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:kiit_archives/app/modules/home/views/pages/bookmark.dart';

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
          centerTitle: true,
          title: Text(
            'KIIT Archives',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black45),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_circle_rounded,
                color: Colors.black54,
              ),
            )
          ],
          elevation: 0,
          bottom: TabBar(
              overlayColor: MaterialStateProperty.resolveWith(getColor),
              labelColor: Colors.black,
              unselectedLabelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              labelStyle: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.transparent,
              isScrollable: true,
              controller: controller.tabController,
              tabs: controller.tabs),
        ),
        body: TabBarView(
          controller: controller.tabController,
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

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.transparent;
    }
    return Colors.transparent;
  }
}
