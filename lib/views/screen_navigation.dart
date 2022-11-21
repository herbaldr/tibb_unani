import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tibb_unani/utils/colors.dart';
import 'package:tibb_unani/views/navigation_app_bar/books_library_screen.dart';

import '../widgets/app_drawer.dart';
import 'navigation_app_bar/hakeem_panel/hakeem_panel_screen.dart';
import 'navigation_app_bar/lughaat/lughaat_screen.dart';

class ScreenNavigation extends StatefulWidget {
  const ScreenNavigation({Key? key}) : super(key: key);

  @override
  State<ScreenNavigation> createState() => _ScreenNavigationState();
}

class _ScreenNavigationState extends State<ScreenNavigation> {

  List _appBarTitle = [
    "طب یونانی",
    "لغات",
    "مجربات طبیب",
  ];

  List _pageList = [
    BookLibraryScreen(),
    LughaatScreen(),
    HakeemPanelScreen(),
  ];

  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app drawer that located on
      // top left side off the app bar...
      drawer: AppDrawer(),
      // App Bar starting from here...
      appBar: AppBar(
        title: Text("${_appBarTitle[_currentIndex]}"),
        centerTitle: true,
        backgroundColor: secondPrimaryColor,
        actions: [
          Icon(Icons.more_vert)
        ],
      ),
      body: ScrollConfiguration(
        behavior: ScrollBehavior().copyWith(overscroll: false),
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            _pageList[_currentIndex]
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        containerHeight: Get.height*0.07,
        backgroundColor: secondPrimaryColor,
        selectedIndex: _currentIndex,
        showElevation: false,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) {
          setState(() {
          _currentIndex = index;
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 100),
              curve: Curves.easeIn);
        });
        },
        items: <BottomNavyBarItem>[
          // BottomNavyBarItem(
          //   inactiveColor: secondaryColor.withOpacity(0.8),
          //   icon: const Icon(Icons.apps),
          //   title: const Text('Home'),
          //   activeColor: Colors.green,
          //   textAlign: TextAlign.center,
          // ),
          BottomNavyBarItem(
            inactiveColor: secondaryColor.withOpacity(0.7),
            icon: const Icon(Icons.book),
            title: const Text('Library'),
            activeColor: appWhiteColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: secondaryColor.withOpacity(0.7),
            icon: const Icon(Icons.sticky_note_2_outlined),
            title: const Text('Settings '),
            activeColor: appWhiteColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: secondaryColor.withOpacity(0.7),
            icon: const Icon(Icons.account_box),
            title: const Text('Account'),
            activeColor: appWhiteColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
