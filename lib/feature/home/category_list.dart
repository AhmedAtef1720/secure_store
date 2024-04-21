
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:gap/gap.dart';
// import 'package:secure_store/core/utils/AppColors.dart';
// import 'package:secure_store/core/utils/textstyle.dart';
// import 'package:secure_store/core/widget/custombtn.dart';
// import 'package:secure_store/feature/home/home_details.dart';

// class category_list extends StatelessWidget {
//   const category_list( {super.key,
//       required this.Title,
//       required this.image,
//       required this.category,
//       required this.price,
//       required this.onPressed, required this.Description});
// final String Description;
//   final String Title;
//   final String image;
//   final String category;
//   final String price;
//   final Function()? onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: appcolors.primerycolor,
//         child: ListView.builder(
          
//           itemBuilder: (context, index) => Padding(
//             padding: const EdgeInsets.all(15),
//             child: Container(
//                 decoration: BoxDecoration(
//                     color: appcolors.whitecolor,
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.favorite_border)),
//                       ],
//                     ),
//                     Image.network(image),
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 25),
//                           child: Column(
//                             crossAxisAlignment:
//                                 CrossAxisAlignment.start,
//                             children: [
//                               Text(price,
//                                   style: getbodyStyle()),
//                               Text(Title,
//                                   style: getTitleStyle()),
//                               Text(Description,maxLines: 1,
//                                   style: getsmallStyle(
//                                       color: Colors.grey)),
//                               Row(
//                                 children: [
//                                   Icon(Icons
//                                       .location_on_rounded),
//                                   Text(
//                                     'cairo,el moqatam',
//                                     style: getsmallStyle(),
//                                   )
//                                 ],
//                               ),
//                               Gap(15)
//                             ],
//                           ),
//                         ),
//                         CustomButton(
//                           text: 'BUY NOW',
//                           onPressed: () {},
//                         ),
//                       ],
//                     )
//                   ],
//                 )),
//           ),
//           itemCount:5,
//         ));
//   }
// }