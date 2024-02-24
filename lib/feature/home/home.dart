import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:secure_store/core/utils/AppColors.dart';
import 'package:secure_store/core/utils/textstyle.dart';
import 'package:secure_store/core/widget/custombtn.dart';
import 'package:secure_store/core/widget/nav_par.dart';
import 'package:svg_flutter/svg.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => homePageState();
}

class homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      bottomNavigationBar:
    
     SalomonBottomBar(
          
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: appcolors.primerycolor,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text("Likes"),
              selectedColor: appcolors.blackcolor,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(Icons.add),
              title: Text("Add"),
              selectedColor: appcolors.greycolor,
            ),

            //Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: appcolors.blackcolor,
            ),
          ],
        ),
     
      backgroundColor: Colors.white,
      body: Padding(
    padding:  EdgeInsets.symmetric(horizontal: 15, vertical: 50),
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
              Container(
                  color: appcolors.primerycolor,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                          decoration: BoxDecoration(
                              color: appcolors.whitecolor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.favorite_border)),
                                ],
                              ),
                              Image.asset('assets/car.png'),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('500,000',
                                            style: getbodyStyle()),
                                        Text('TATA Aria',
                                            style: getTitleStyle()),
                                        Text('2012 - 128,000Kms',
                                            style: getsmallStyle(
                                                color: Colors.grey)),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on_rounded),
                                            Text(
                                              'cairo,el moqatam',
                                              style: getsmallStyle(),
                                            )
                                          ],
                                        ),
                                        Gap(15)
                                      ],
                                    ),
                                  ),
                                  CustomButton(
                                    text: 'BUY NOW',
                                    onPressed: () {},
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                    itemCount: 5,
                  )),
              Icon(Icons.favorite),
              Icon(Icons.add),
              Icon(Icons.person_2_rounded),
            ],
          ))
        ],
      ),
    ),
      ),
    );
  }
}
