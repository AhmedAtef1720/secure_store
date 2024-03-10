
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:secure_store/core/utils/AppColors.dart';
import 'package:secure_store/core/utils/textstyle.dart';
import 'package:secure_store/core/widget/custombtn.dart';
import 'package:secure_store/feature/home/home_details.dart';

class category_list extends StatelessWidget {
  const category_list({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: appcolors.primerycolor,
        child: ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(15),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomeDetails(),
                ));
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: appcolors.whitecolor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_border)),
                        ],
                      ),
                      Image.asset('assets/car3.png'),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text('5,000,000',
                                    style: getbodyStyle()),
                                Text('Benz - E Class',
                                    style: getTitleStyle()),
                                Text('2012 - 128,000Kms',
                                    style: getsmallStyle(
                                        color: Colors.grey)),
                                Row(
                                  children: [
                                    Icon(Icons
                                        .location_on_rounded),
                                    Text(
                                      'cairo,el moqatam',
                                      style: getsmallStyle(),
                                    )
                                  ],
                                ),
                                Gap(15)
                              ],
                            ),
                          ),
                          CustomButton(
                            text: 'BUY NOW',
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ),
          itemCount: 5,
        ));
  }
}