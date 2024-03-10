
import 'package:flutter/material.dart';
import 'package:secure_store/core/utils/AppColors.dart';
import 'package:secure_store/core/utils/textstyle.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.background = const Color(0xffE5AE8),
    required this.text,
    required this.onPressed,  this.fontSize=14, 
  });
  final String text;
  final Function() onPressed;
  final Color background;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: appcolors.primerycolor,

            foregroundColor: appcolors.whitecolor),
        onPressed: onPressed,
        child: Text(text,style: TextStyle(fontSize: fontSize),));
  }
}
