// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:secure_store/core/utils/AppColors.dart';
// import 'package:secure_store/core/utils/textstyle.dart';

// String? path;

// class addProductView extends StatefulWidget {
//   const addProductView({super.key});

//   @override
//   State<addProductView> createState() => _addProductViewState();
// }

// class _addProductViewState extends State<addProductView> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appcolors.primerycolor,
//         centerTitle: true,
//         title: Text(
//           'Add product',
//           style: getbodyStyle(color: Colors.white),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//             child: Form(
//                 key: _formKey,
//                 child: SingleChildScrollView(
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                       GestureDetector(
//                         onTap: () {
//                           uploadFromGallery();
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: (path != null)
//                                   ? FileImage(File(path!)) as ImageProvider
//                                   : const AssetImage('assets/car2.png'),
//                             ),
//                           ),
//                           width: double.infinity,
//                           height: 220,
//                         ),
//                       ),
//                       TextFormField(
//                         keyboardType: TextInputType.text,
//                         maxLines: 1,
//                         // controller: ,
//                         style: TextStyle(color: appcolors.blackcolor),
//                         decoration: const InputDecoration(hintText: 'name'),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'enter item name';
//                           } else {
//                             return null;
//                           }
//                         },
//                       ),
//                       Gap(5),
//                       Row(
//                         children: [
//                           Text(
//                             '',
//                             style: getsmallStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 15),
//                           )
//                         ],
//                       ),
//                       TextFormField(
//                         keyboardType: TextInputType.text,
//                         maxLines: 1,
//                         // controller: _address,
//                         style: TextStyle(color: appcolors.blackcolor),
//                         decoration: const InputDecoration(hintText: 'price'),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'enter item price';
//                           } else {
//                             return null;
//                           }
//                         },
//                       ),
//                       Divider(
//                         color: appcolors.blackcolor,
//                         endIndent: 15,
//                         indent: 15,
//                       ),
//                       Gap(8),
//                       Row(
//                         children: [Text('Description')],
//                       ),
//                       TextFormField(
//                         keyboardType: TextInputType.text,
//                         maxLines: 5,
//                         // controller: _address,
//                         style: TextStyle(color: appcolors.blackcolor),
//                         decoration: const InputDecoration(
//                             hintText: 'enter item description'),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'enter item description';
//                           } else {
//                             return null;
//                           }
//                         },
//                       ),
//                     ])))),
//       ),
//     );
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
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:secure_store/core/services/local_storage.dart';
import 'package:secure_store/core/utils/AppColors.dart';
import 'package:secure_store/core/utils/textstyle.dart';
import 'package:secure_store/core/widget/nav_par.dart';
import 'package:secure_store/feature/home/home.dart';
import 'package:secure_store/feature/presentation/model/view/categoryList.dart';

String? path;
String description='';
class addProductView extends StatefulWidget {
  const addProductView({Key? key}) : super(key: key);

  @override
  State<addProductView> createState() => _addProductViewState();
}

class _addProductViewState extends State<addProductView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController _description = TextEditingController();
  final TextEditingController _name = TextEditingController();
 final TextEditingController _price = TextEditingController();
String _category = category[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( actions: [
            TextButton(
                onPressed: () {
                  //   // image and name
                  //   // no image
                  //   // no name
                  // //   // no image and no name
                  if (path != null && description.isNotEmpty) {
                    AppLocal.cacheData(AppLocal.IMAGE_KEY, path);
                    AppLocal.cacheData(AppLocal.DESCRIPTION_KEY, description);
                    AppLocal.cacheData(AppLocal.ISUPLOAD_KEY, true);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const homePage(),
                    ));
                  } else if (path == null && description.isNotEmpty) {
                    showErrorDialog(context, Text('Please Upload Your image'));
                  } else if (path != null && description.isEmpty) {
                    showErrorDialog(context, Text('Enter Your Name'));
                  } else {
                    showErrorDialog(context,
                        Text('Please Upload Your image and Enter Your Name'));
                  }
                },
                child: Text('Done', style: getbodyStyle()))
          ],
        backgroundColor: appcolors.primerycolor,
        centerTitle: true,
        title: Text(
          'Add product',
          style: getbodyStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                
                children: [
                  Container(
                      width: double.infinity,
                      height: 220,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: (path != null)
                            ? FileImage(File(path!)) as ImageProvider
                            : const AssetImage(
                                'assets/car2.png',
                              ),
                      ))),

                  const Gap(2),
                  SizedBox(
                    child: IconButton(
                        onPressed: () {
                          uploadFromGallery();
                        },
                        icon: Icon(
                          Icons.photo_library_outlined,
                          color: appcolors.primerycolor,
                        )),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _name,
                    maxLines: 1,
                    style: TextStyle(color: appcolors.blackcolor),
                    decoration: const InputDecoration(hintText: 'name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter item name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Gap(1),
                  
                      TextFormField(
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                         controller: _price,
                        style: TextStyle(color: appcolors.blackcolor),
                        decoration: const InputDecoration(hintText: 'price'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter item price';
                          } else {
                            return null;
                          }
                        },
                      ),
                      Divider(
                        color: appcolors.blackcolor,
                        endIndent: 15,
                        indent: 15,
                      ),
                      Gap(8),
                      Row(
                        children: [Text('Description',style: getbodyStyle(fontSize: 16),)],
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        maxLines: 5,
                         controller: _description,
                        style: TextStyle(color: appcolors.blackcolor),
                        decoration: const InputDecoration(
                            hintText: 'enter item description'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter item description';
                          } else {
                            return null;
                          }
                        },
                      ), Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton(
                      isExpanded: true,
                      iconEnabledColor: appcolors.whitecolor,
                      icon: const Icon(Icons.expand_circle_down_outlined),
                      value: _category,
                      onChanged: (String? newValue) {
                        setState(() {
                          _category = newValue ?? category[0];
                        });
                      },
                      items:category.map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: appcolors.primerycolor,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  // ... rest of your code
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

 uploadFromGallery() async {
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }
  
  void showErrorDialog(BuildContext context, Text text) {}
}
