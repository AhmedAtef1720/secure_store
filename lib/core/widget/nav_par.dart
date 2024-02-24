



import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:secure_store/feature/home/home.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: homePage(),
      bottomNavigationBar:
    
     SalomonBottomBar(
          
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.purple,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text("Likes"),
              selectedColor: Colors.pink,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(Icons.search),
              title: Text("Search"),
              selectedColor: Colors.orange,
            ),

            /// Profile
            // SalomonBottomBarItem(
            //   icon: Icon(Icons.person),
            //   title: Text("Profile"),
            //   selectedColor: Colors.teal,
            // ),
          ],
        ))  ;
  }
}