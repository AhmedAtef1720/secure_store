import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:secure_store/core/utils/AppColors.dart';
import 'package:secure_store/core/utils/textstyle.dart';
import 'package:secure_store/core/widget/custombtn.dart';

class HomeDetails extends StatefulWidget {
  const HomeDetails({super.key});

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: appcolors.primerycolor,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border, color: Colors.black))
          ]),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
            child: Image.asset(
          'assets/car3.png',
          height: 180,
        )),
        Gap(20),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Benz - E Class',
                style: getTitleStyle(fontWeight: FontWeight.w900),
              ),
              Text('2019 - 18,000Kms'),
              Gap(5),
              Text(
                'Chennai, Tamilnadu',
                style: getsmallStyle(fontSize: 14),
              ),
              Gap(5),
              Text(
                '5,000,000',
                style: getTitleStyle(),
              ),
              Text('Description', style: getsmallStyle()),
              Gap(5),
              Text(
                'Benz E Class Top model low Kilometers Additional Boosters Added Engine Capacity/ Displacement 500CC.ICU Make Month : March Register Place: TN( Tamilnadu) Pollution Access Disgranted',
                style: getsmallStyle(fontSize: 13),
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
                          'MOSTAFA',
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
            SizedBox(
                height: 50,
                width: 200,
                child: CustomButton(
                  onPressed: () {},
                  text: 'Chat Now',
                  fontSize: 33,
                )),
          ],
        )
      ]),
    );
  }
}
