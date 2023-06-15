import 'package:Vermajee/consts/consts.dart';
import 'package:Vermajee/contollers/home_controller.dart';
import 'package:Vermajee/views/cart_screen/cart_page.dart';
import 'package:Vermajee/views/category_screen/category_page.dart';
import 'package:Vermajee/views/home_screen/home_page.dart';
import 'package:Vermajee/views/profile_screen/profile_page.dart';
import 'package:Vermajee/widgets_common/exit_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var Controller = Get.put(HomeController());
    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(icHome, width: 26), label: home),
      BottomNavigationBarItem(
          icon: Image.asset(icCategories, width: 26), label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(icCart, width: 26), label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(icProfile, width: 26), label: account)
    ];

    var navBody = [
      const HomePage(),
      const Category(),
      const CartPage(),
      const Profile()
    ];

    return WillPopScope(
      onWillPop: () async {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => exitdialog(context));
        return false;
      },
      child: Scaffold(
          body: Column(
            children: [
              Obx(
                () => Expanded(
                    child: navBody.elementAt(Controller.currentNavindex.value)),
              )
            ],
          ),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              currentIndex: Controller.currentNavindex.value,
              backgroundColor: darkFontGrey,
              selectedItemColor: whiteColor,
              selectedLabelStyle: const TextStyle(fontFamily: semibold),
              type: BottomNavigationBarType.fixed,
              items: navbarItem,
              onTap: (value) {
                Controller.currentNavindex.value = value;
              },
            ),
          )),
    );
  }
}
