import 'package:flutter/material.dart';
import 'package:flutter_intern_test/app/common/util/exports.dart';
import 'package:flutter_intern_test/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_intern_test/app/modules/home/views/home_page.dart';
import 'package:flutter_intern_test/app/modules/widgets/base_widget.dart';
import 'package:flutter_intern_test/app/modules/widgets/custom_appbar_widget.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      HomePage(),
      const Text('Search Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
      const Text('Profile Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
      Text('Profile Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ];

    return Scaffold(
      appBar: CustomAppbarWidget(
        titleSpacing: 0,
        title: 'Sector-44, Real Estate, Sector- 62, Gurugram',
        addBackButton: true,
        backgroundColor: AppColors.white,
        leading: Icon(
          Icons.location_on,
          color: Colors.grey.shade700,
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Colors.grey.shade700,
              size: 35,
            ),
          )
        ],
        textStyle: TextStyle(
            color: Colors.grey.shade500,
            fontWeight: FontWeight.bold,
            fontSize: 15),
        bottom: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                height: 38,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  cursorHeight: 20,
                  autofocus: false,
                  decoration: InputDecoration(
                    filled: false,
                    hintText: "Search for a service",
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    prefixIcon: Icon(Icons.search),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                controller.open();
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 15, bottom: 15),
                child: Image(
                  image: AssetImage('assets/images/whatsapp.png'),
                  height: 30,
                  width: 30,
                ),
              ),
            )
          ],
        ),
      ),
      body: Obx(() => Center(
            child: _widgetOptions.elementAt(controller.selectedIndex.value),
          )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book_outlined),
                  label: ' Bookings',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_outlined),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  label: 'Accounts',
                ),
              ],
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.selectedIndex.value,
              selectedItemColor: AppColors.secondaryColors,
              unselectedItemColor: Colors.grey.shade500,
              iconSize: 25,
              onTap: controller.onItemTapped,
              elevation: 5)),
    );
  }
}
