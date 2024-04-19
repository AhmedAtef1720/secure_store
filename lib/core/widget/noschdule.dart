import 'package:flutter/material.dart';
import 'package:secure_store/core/utils/textstyle.dart';

class NoScheduledWidget extends StatelessWidget {
  const NoScheduledWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       
          Text('Don`t have any item   ', style: getbodyStyle()),
        ],
      ),
    );
  }
}