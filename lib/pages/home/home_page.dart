import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
//import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../utils/colors.dart';
import '../cart/cart_history.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex=0;

  List pages=[
    MainFoodPage(),
    Container(child: Center(child: Text("next page"))),
    CartHistory(),
    Container(child: Center(child: Text("next next next page"))),
  ];

  void onTapNav(int index){
    setState((){
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  // scaffold offers a different color compared to container, which is better
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: "history"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "me"),
        ],
      ),
    );
  }

  // more bottom navbar style options
  // you've gotta add: persistent_bottom_nav_bar: ^5.0.2 to pubspec.yaml
  /*
  late PersistentTabController _controller;

  @override
  void initState(){
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style5, // u have up to 19 styles i think // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      MainFoodPage(),
      Container(child: Center(child: Text("next page"))),
      Container(child: Center(child: Text("next next page"))),
      Container(child: Center(child: Text("next next next page"))),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.archivebox_fill),
        title: ("Archive"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart_fill),
        title: ("Cart"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("Me"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }*/

}
