import 'package:flutter/material.dart';
import 'package:secure_store/core/utils/AppColors.dart';
import 'package:secure_store/core/utils/textstyle.dart';

class favoriteView extends StatefulWidget {
  const favoriteView({super.key});

  @override
  State<favoriteView> createState() => _favoriteViewState();
}

class _favoriteViewState extends State<favoriteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolors.primerycolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('There is Nothing!',style: getbodyStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
