
import 'package:flutter/material.dart';
import 'package:secure_store/core/utils/AppColors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.background = const Color(0xffE5AE8),
    required this.text,
    required this.onPressed,
  });
  final String text;
  final Function() onPressed;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: appcolors.btncolor,

            foregroundColor: appcolors.whitecolor),
        onPressed: onPressed,
        child: Text(text));
  }
}
