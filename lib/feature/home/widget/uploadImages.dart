// // uploadFromGallery() async {
// //     var pickedImage =
// //         await ImagePicker().pickImage(source: ImageSource.gallery);
// //     if (pickedImage != null) {
// //       setState(() {
// //         path = pickedImage.path;
// //       });
// //     }
// //   }

// // String? path;
// //  backgroundImage: (path != null)
// //                       ? FileImage(File(path!)) as ImageProvider
// //                       : const AssetImage(
// //                           'assets/logon.png',
// //                         ),import 'dart:io';

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:inistans_news/core/functions/dialogs.dart';
// import 'package:inistans_news/core/services/local_storage.dart';
// import 'package:inistans_news/core/utils/appcolors.dart';
// import 'package:inistans_news/core/utils/textstyle.dart';
// import 'package:inistans_news/core/widget/custombtn.dart';

// import 'package:inistans_news/feature/home/widget/navbar.dart';
// import 'package:secure_store/core/utils/AppColors.dart';

// String? path;
// String name = '';

// class UploadView extends StatefulWidget {
//   const UploadView({super.key});

//   @override
//   State<UploadView> createState() => _UploadViewState();
// }

// class _UploadViewState extends State<UploadView> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           actions: [
//             TextButton(
//                 onPressed: () {
//                   //   // image and name
//                   //   // no image
//                   //   // no name
//                   // //   // no image and no name
//                   if (path != null && name.isNotEmpty) {
//                     AppLocal.cacheData(AppLocal.IMAGE_KEY, path);
//                     AppLocal.cacheData(AppLocal.NAME_KEY, name);
//                     AppLocal.cacheData(AppLocal.ISUPLOAD_KEY, true);
//                     Navigator.of(context).pushReplacement(MaterialPageRoute(
//                       builder: (context) => const NavBarWidget(),
//                     ));
//                   } else if (path == null && name.isNotEmpty) {
//                     showErrorDialog(context, Text('Please Upload Your image'));
//                   } else if (path != null && name.isEmpty) {
//                     showErrorDialog(context, Text('Enter Your Name'));
//                   } else {
//                     showErrorDialog(context,
//                         Text('Please Upload Your image and Enter Your Name'));
//                   }
//                 },
//                 child: Text('Done', style: getbodyStyle()))
//           ],
//         ),
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(15),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(width: double.infinity,
//                   height: 80,decoration: BoxDecoration(image: DecorationImage(image: 
//                    (path != null)
//                       ? FileImage(File(path!)) as ImageProvider
//                       : const AssetImage(
//                           'assets/logon.png',
//                         ),
//                 ))),
                
                
//                 const Gap(2),
//                 SizedBox(
                    
//                     child:IconButton(onPressed: () {
//                         uploadFromGallery();
//                       }, icon: Icon(Icons.photo_library_outlined ,color: appcolors.primerycolor,)),
                      
                     
//                     ),
//                 const Gap(20),
//                 Divider(
//                   thickness: .5,
//                   endIndent: 20,
//                   indent: 20,
//                   color: appcolors.blackcolor,
//                 ),
//                 const Gap(20),
//                 Expanded(
//                   child: TextFormField(
//                     // inputFormatters: [
//                     //   FilteringTextInputFormatter.allow(RegExp(r'[a-z]'))
//                     // ],
//                     onChanged: (value) {
//                       setState(() {
//                         name = value;
//                       });
//                     },
//                     keyboardType: TextInputType.name,
//                     decoration: const InputDecoration(
//                         prefixIcon:
//                             Icon(Icons.person_2_sharp, color: Colors.white),
//                         hintText: 'Enter Your Name',
//                         hintStyle: TextStyle(color: Colors.white)),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   uploadFromCamera() async {
//     // OPEN CAMERA AND PICK IMAGE
//     var pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (pickedImage != null) {
//       setState(() {
//         path = pickedImage.path;
//       });
//     }
//   }

//   uploadFromGallery() async {
//     var pickedImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       setState(() {
//         path = pickedImage.path;
//       });
//     }
//   }
// }
