import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:trafic_static_app/constants/colors.dart';
import 'package:trafic_static_app/core/helper/global_functions.dart';
import 'package:trafic_static_app/view/screens/choose_website_screen.dart';
import 'package:trafic_static_app/view/screens/page1.dart';
import 'package:trafic_static_app/view/screens/page10.dart';
import 'package:trafic_static_app/view/screens/page2.dart';
import 'package:trafic_static_app/view/screens/page3.dart';
import 'package:trafic_static_app/view/screens/page4.dart';
import 'package:trafic_static_app/view/screens/page5.dart';
import 'package:trafic_static_app/view/screens/page6.dart';
import 'package:trafic_static_app/view/screens/page7.dart';
import 'package:trafic_static_app/view/screens/page8.dart';
import 'package:trafic_static_app/view/screens/page9.dart';
import 'package:trafic_static_app/view/screens/setting_screen.dart';
import 'package:trafic_static_app/view/widgets/primary_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                CircleAvatar(
                  maxRadius: 42.h,
                  backgroundImage: const AssetImage('images/wordpress.png'),
                ),
                ListTile(
                  onTap: () {
                    _pageController.jumpToPage(0);
                    Navigator.pop(context);
                  },
                  title: const PrimaryText(
                    'Statistics, Traffic Report',
                    color: Colors.black87,
                    fontSize: 14,
                    textAlign: TextAlign.start,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black87,
                    size: 15,
                  ),
                ),
                ListTile(
                  onTap: () {
                    _pageController.jumpToPage(1);
                    Navigator.pop(context);
                  },
                  title: const PrimaryText(
                    'Map, Summary Statics',
                    color: Colors.black87,
                    fontSize: 14,
                    textAlign: TextAlign.start,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black87,
                    size: 15,
                  ),
                ),
                ListTile(
                  onTap: () {
                    _pageController.jumpToPage(2);
                    Navigator.pop(context);
                  },
                  title: const PrimaryText(
                    'Recent Visitors By ID',
                    color: Colors.black87,
                    fontSize: 14,
                    textAlign: TextAlign.start,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black87,
                    size: 15,
                  ),
                ),
                ListTile(
                  onTap: () {
                    _pageController.jumpToPage(3);
                    Navigator.pop(context);
                  },
                  title: const PrimaryText(
                    'Traffic By Countries',
                    color: Colors.black87,
                    fontSize: 14,
                    textAlign: TextAlign.start,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black87,
                    size: 15,
                  ),
                ),
                ListTile(
                  onTap: () {
                    _pageController.jumpToPage(4);
                    Navigator.pop(context);
                  },
                  title: const PrimaryText(
                    'Browsers, Search Engines',
                    color: Colors.black87,
                    fontSize: 14,
                    textAlign: TextAlign.start,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black87,
                    size: 15,
                  ),
                ),
                ListTile(
                  onTap: () {
                    _pageController.jumpToPage(5);
                    Navigator.pop(context);
                  },
                  title: const PrimaryText(
                    'Top Referring Countries',
                    color: Colors.black87,
                    fontSize: 14,
                    textAlign: TextAlign.start,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black87,
                    size: 15,
                  ),
                ),
                ListTile(
                  onTap: () {
                    _pageController.jumpToPage(5);
                    Navigator.pop(context);
                  },
                  title: const PrimaryText(
                    ' Today Traffic By Country',
                    color: Colors.black87,
                    fontSize: 14,
                    textAlign: TextAlign.start,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black87,
                    size: 15,
                  ),
                ),
                ListTile(
                  onTap: () {
                    _pageController.jumpToPage(6);
                    Navigator.pop(context);
                  },
                  title: const PrimaryText(
                    'Top Referring Sites',
                    color: Colors.black87,
                    fontSize: 14,
                    textAlign: TextAlign.start,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black87,
                    size: 15,
                  ),
                ),
                ListTile(
                  onTap: () {
                    _pageController.jumpToPage(7);
                    Navigator.pop(context);
                  },
                  title: const PrimaryText(
                    'Visits Time Graph',
                    color: Colors.black87,
                    fontSize: 14,
                    textAlign: TextAlign.start,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black87,
                    size: 15,
                  ),
                ),
                ListTile(
                  onTap: () {
                    _pageController.jumpToPage(8);
                    Navigator.pop(context);
                  },
                  title: const PrimaryText(
                    'Traffic By Title',
                    color: Colors.black87,
                    fontSize: 14,
                    textAlign: TextAlign.start,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black87,
                    size: 15,
                  ),
                ),
                ListTile(
                  onTap: () {
                    _pageController.jumpToPage(9);
                    Navigator.pop(context);
                  },
                  title: const PrimaryText(
                    'Last Search Words',
                    color: Colors.black87,
                    fontSize: 14,
                    textAlign: TextAlign.start,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black87,
                    size: 15,
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.settings),
                  onTap: () {
                    navigateTo(context, const SettingScreen());
                  },
                  title: const PrimaryText(
                    'Settings',
                    color: Colors.black87,
                    fontSize: 14,
                    textAlign: TextAlign.start,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black87,
                    size: 15,
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    'images/website_icon.png',
                    height: 20.h,
                    width: 20.w,
                  ),
                  onTap: () {
                    Get.deleteAll(force: true);
                    navigateAndReplace(context, ChooseWebsiteScreen());
                  //  Restart.restartApp();
                  },
                  title: const PrimaryText(
                    'Choose Website',
                    color: Colors.black87,
                    fontSize: 14,
                    textAlign: TextAlign.start,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black87,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          IconButton(
              onPressed: () {
                navigateTo(context, const SettingScreen());
              },
              icon: const Icon(Icons.settings))
        ],
        title: const PrimaryText(
          'Statistics Screen',
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      body: LiquidPullToRefresh(
        onRefresh: () async {
          Get.reloadAll(force: true);
          // TrafficsController().onInit();
          // Page2Controller().onInit();
          // Page3Controller().onInit();
          // Page4Controller().onInit();
          // Page5Controller().onInit();
          // Page6Controller().onInit();
          // Page7Controller().onInit();
          // Page9Controller().onInit();
        },
        color: primaryColor,
        animSpeedFactor: 3,
        springAnimationDurationInMilliseconds: 1500,
        showChildOpacityTransition: false,
        child: PageView(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: const [
              Page1(),
              Page2(),
              Page3(),
              Page4(),
              Page5(),
              Page6(),
              Page7(),
              Page8(),
              Page9(),
              Page10(),
            ]),
      ),
    );
  }
}
