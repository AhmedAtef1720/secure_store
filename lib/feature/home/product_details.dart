import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:secure_store/core/utils/AppColors.dart';
import 'package:secure_store/core/utils/textstyle.dart';
import 'package:secure_store/core/widget/Alertdialog.dart';
import 'package:secure_store/core/widget/custombtn.dart';
import 'package:secure_store/feature/home/widget/product_list.dart';
import 'package:secure_store/feature/screens/favorite/favorite.dart';

class HomeDetails extends StatefulWidget {
  const HomeDetails({super.key, required this.title, required this.image, required this.price, required this.description, required this.phone});
final String title;
final String image;
final String price;
final String description;
final String phone;
  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
   
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int isSelected = -1;
  User? user;

    
      final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _getUser() async {
    user = _auth.currentUser;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: appcolors.primerycolor,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          actions: [IconButton(
                                    onPressed: () {
                                      // if (_formKey.currentState!.validate() && isSelected != -1) {
                                      //   createCart();
                                      //   showAlertDialog(
                                      //     context,
                                      //     title: 'Done !',
                                      //     ok: 'press to go to favorite',
                                      //     onPressed: () {
                                      //       Navigator.pop(context);
                                      //       Navigator.pushReplacement(
                                      //         context,
                                      //         MaterialPageRoute(
                                      //           builder: (context) => const  favoriteView(),
                                      //         ),
                                      //       );
                                      //     },
                                      //   );
                                      // }
                                    },
                                    icon: Icon(Icons.favorite_border))
          ]),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
            child: Image.network(
          widget.image,
          height: 190,
          width: double.infinity,
        )),
        Gap(20),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title,
                style: getTitleStyle(fontWeight: FontWeight.w900),
              ),  Divider(
                      color: appcolors.primerycolor,
                      endIndent: 15,
                      indent: 15,
                    ),
             
              Gap(5),
              Text(
               widget.price,
                style: getTitleStyle(),
              // ), Divider(
              //         color: appcolors.primerycolor,
              //         endIndent: 15,
              //         indent: 15,
                    ),
              // Text('Description', style: getsmallStyle(color: Colors.grey)),
              Gap(5), Divider(
                      color: appcolors.primerycolor,
                      endIndent: 15,
                      indent: 15,
                    ),
              Text(
               widget.description,
                style: getsmallStyle(fontSize: 13),
                textAlign: TextAlign.start,
              
                    ),
             //  Text('Phone', style: getbodyStyle(color: Colors.grey)),
              Gap(5), Divider(
                      color: appcolors.primerycolor,
                      endIndent: 15,
                      indent: 15,
                    ),
              Text(
               widget.phone,
                style: getsmallStyle(fontSize: 13,color:Colors.green ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        Stack(children: [
          Container(
            color: appcolors.primerycolor,
            height: 95,
            width: double.infinity,
          ),
          Positioned(
              left: 30,
              top: 5,
              bottom: 5,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: appcolors.greycolor,
                    radius: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Posted By',
                            style: TextStyle(color: Colors.white)),
                        Text(
                              user!.displayName??''
,
                          style: getTitleStyle(color: Colors.white),
                        ),
                        Text('See Profile',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ))
        ]),
        Gap(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //     height: 50,
            //     width: 200,
            //     child: CustomButton(
            //       onPressed: () {},
            //       text: 'Chat Now',
            //       fontSize: 33, Function: () {  },
            //     )),
          ],
        )
      ]),
    );
  }
}
