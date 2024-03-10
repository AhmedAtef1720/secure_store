import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:secure_store/core/utils/AppColors.dart';
import 'package:secure_store/feature/home/category_list.dart';
import 'package:svg_flutter/svg.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => homePageState();
}

class homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Find Cars, Mobile, Bike and More..",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(Icons.search, color: Colors.black, size: 40),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35))),
              ),
              ButtonsTabBar(
                height: 120,
                splashColor: Colors.white,

                buttonMargin: EdgeInsets.all(15),
                // Customize the appearance and behavior of the tab bar
                backgroundColor: Colors.white,
                borderWidth: 1,
                borderColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                unselectedBorderColor: Colors.white,
                unselectedBackgroundColor: Colors.white,
                unselectedLabelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                // Add your tabs here
                tabs: [
                  Tab(
                    icon: SvgPicture.asset('assets/icon car.svg'),
                  ),
                  Tab(
                    icon: SvgPicture.asset('assets/icon building.svg'),
                  ),
                  Tab(
                    icon: SvgPicture.asset('assets/icon mobile.svg'),
                  ),
                  Tab(
                    icon: SvgPicture.asset('assets/icon bike.svg'),
                  ),
                ],
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  category_list(),
                  category_list(),
                  category_list(),
                  category_list(),
                  // Icon(Icons.favorite),
                  // Icon(Icons.add),
                  // Icon(Icons.person_2_rounded),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

