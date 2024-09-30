import 'package:animations/animations.dart';
import 'package:digitalsalt_assignment/res/app_colors/colors.dart';
import 'package:digitalsalt_assignment/res/icons_asset/images.dart';
import 'package:digitalsalt_assignment/view/account/account.dart';
import 'package:digitalsalt_assignment/view/course/course.dart';
import 'package:digitalsalt_assignment/view/home/homepage.dart';
import 'package:digitalsalt_assignment/view/message/message.dart';
import 'package:digitalsalt_assignment/view/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

final rootPageScrollController = ScrollController(initialScrollOffset: 0.0);

class RootPage extends StatefulWidget {
  final int selectedIndex;

  const RootPage({super.key, this.selectedIndex = 0});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;
  int parentID = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }


  void _onItemTapped(int index) {
    if (rootPageScrollController.hasClients) {
      rootPageScrollController.animateTo(1,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    }
    setState(() {
      _selectedIndex = index;
      HapticFeedback.lightImpact();
    });
  }

  final pageOptions = [
    const HomePage(),
    const CoursePage(),
    const SizedBox(),
    const MessagePage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    resizeToAvoidBottomInset: false,
    body: PageTransitionSwitcher(
      transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
          FadeThroughTransition(
        animation: primaryAnimation,
        secondaryAnimation: secondaryAnimation,
        child: child,
      ),
      child: pageOptions[_selectedIndex],
    ),
    bottomNavigationBar: Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: AppColor.kblack.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            backgroundColor: AppColor.kwhite,
            elevation: 0,
            selectedItemColor: AppColor.kprimaryColor,
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColor.kprimaryColor,
            ),
            unselectedLabelStyle: const TextStyle(
              color: AppColor.klightGrey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            unselectedFontSize: 12,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(IconAssets.homeActiveIcon),
                icon: SvgPicture.asset(IconAssets.homeInactiveIcon),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(IconAssets.courseActiveIcon),
                icon: SvgPicture.asset(IconAssets.courseInactiveIcon),
                label: 'Course',
              ),
              const BottomNavigationBarItem(
                icon: SizedBox.shrink(),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(IconAssets.messageInactiveIcon,
                    color: AppColor.kprimaryColor),
                icon: SvgPicture.asset(IconAssets.messageInactiveIcon),
                label: 'Message',
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(IconAssets.accountInactiveIcon,
                    color: AppColor.kprimaryColor),
                icon: SvgPicture.asset(IconAssets.accountInactiveIcon),
                label: 'Account',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    floatingActionButton: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
         bottom: 25,
          child: SizedBox(
            height: 70,
            width: 70,
            child: FloatingActionButton(
               
              onPressed: () {
                Get.to(() => const SearchPage());
              },
              backgroundColor: const Color(0xfff5f7ff),
              elevation: 0,
              shape: const CircleBorder(
                side: BorderSide(color: AppColor.kwhite, width: 6),
              ),
              child: SvgPicture.asset(
                IconAssets.searchActiveIcon,
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}