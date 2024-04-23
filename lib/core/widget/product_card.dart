import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_store/core/utils/AppColors.dart';
import 'package:secure_store/core/utils/textstyle.dart';
import 'package:secure_store/feature/presentation/data/cubit/auth_cubit.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.onPressed,
    required this.onRemovedPressed,
  });

  final String title;
  final String image;
  final String price;

  final Function()? onPressed;
  final Function onRemovedPressed;
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(top: 3.0),
      child: Card(
        color: Colors.blue[50],
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: onPressed,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(13)),
                  child: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: appcolors.whitecolor),
                    child: Image.network(
                      image,
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: getTitleStyle(fontSize: 16),
                      ),
                      Text(
                        price,
                        style: getbodyStyle(),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: ()=>onRemovedPressed(),                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
