import 'package:flutter/material.dart';
import 'package:secure_store/core/utils/AppColors.dart';
import 'package:secure_store/core/utils/textstyle.dart';

class chatView extends StatefulWidget {
  const chatView({super.key});

  @override
  State<chatView> createState() => _chatViewState();
}

class _chatViewState extends State<chatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolors.whitecolor,
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [Text('chat',style: getsmallStyle(color:Colors.black ),)])),
    );
  }
}