import 'package:flutter/material.dart';
import 'package:secure_store/core/utils/AppColors.dart';
import 'package:secure_store/core/utils/textstyle.dart';

class TileWidget extends StatelessWidget {
  const TileWidget({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: appcolors.primerycolor,
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(child: Text(text, style: getbodyStyle())),
      ],
    );
  }
}