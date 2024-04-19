import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:secure_store/core/services/routing.dart';
import 'package:secure_store/core/services/showLoadingDialog.dart';
import 'package:secure_store/core/utils/AppColors.dart';
import 'package:secure_store/core/utils/textstyle.dart';
import 'package:secure_store/core/widget/Alertdialog.dart';
import 'package:secure_store/core/widget/custombtn.dart';
import 'package:secure_store/feature/home/product_details.dart';
import 'package:secure_store/feature/presentation/data/cubit/auth_cubit.dart';
import 'package:secure_store/feature/presentation/data/cubit/auth_state.dart';
import 'package:secure_store/feature/presentation/model/view/view_model/Product_model.dart';
import 'package:secure_store/feature/screens/bottomNavBar.dart';
import 'package:secure_store/feature/screens/favorite/MyFavoriteList.dart';
import 'package:secure_store/feature/screens/favorite/favorite.dart';

class productList extends StatefulWidget {
  final  category;
  const productList({super.key,required this.category});

  @override
  _productListState createState() => _productListState();
}

class _productListState extends State<productList> {
  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  Future<void> _getUser() async {
    user = _auth.currentUser;
  }

  void initState() {
    super.initState();
    _getUser();
  }

  Widget build(BuildContext context) {
    // orderBy  للترتيب
    // where  للمقارنة
    // startAt and endAt  للسيرش
    return SafeArea(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Product')
            .where('productCategory',isEqualTo: widget.category)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot product = snapshot.data!.docs[index];
                if (product['productTitle'] == null ||
                    product['productImage'] == null ||
                    product['productPrice'] == null ||
                    product['productPhone'] == null ||
                    product['productDescription'] == null) {
                  return const SizedBox();
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Stack(children: [
                    Container(
                        decoration: BoxDecoration(
                            color: appcolors.greycolor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Image.network(product['productImage'],
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(25),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(product['productTitle'],
                                          style: getTitleStyle(
                                              color: appcolors.primerycolor)),
                                      Text(product['productPrice'],
                                          style: getbodyStyle()),
                                      Row(
                                        children: [
                                          Text(product['productDescription'],
                                              maxLines: 1,
                                              style: getsmallStyle(
                                                  color: Colors.white)),
                                                 
                                        
                                        ],
                                      ),  Text(product['productPhone'],
                                              maxLines: 1,
                                              style: getsmallStyle(
                                                  color: Colors.green))
                                    ],
                                  ),
                                ),
                                CustomButton(
                                  text: 'BUY NOW',
                                  onPressed: () {
                                    push(
                                        context,
                                        HomeDetails(
                                          title: product['productTitle'],
                                           phone: product['productPhone'],
                                          price: product['productPrice'],
                                          description:
                                              product['productDescription'],
                                          image: product['productImage'],
                                        ));
                                  },
                                  Function: () {},
                                ),
                                Gap(20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    BlocListener<AuthCubit, AuthStates>(
                                      listener: (BuildContext context,
                                          AuthStates state) {
                                        if (state
                                            is UpdateCartDataSuccesState) {
                                          push(context, const favoriteView());
                                        } else if (state
                                            is UpdateCartDataErrorState) {
                                          Navigator.pop(context);

                                          showErrorDialog(
                                              context, Text('error'));
                                        } else {
                                          showLoadingDialog(context);
                                        }
                                      },
                                      child: IconButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              context
                                                  .read<AuthCubit>()
                                                  .updateCartData(ProductModel(
                                                      productId: '',
                                                      productTitle: product[
                                                          'productTitle'],
                                                      productPrice: product[
                                                          'productPrice'],
                                                      productCategory: '',
                                                      productDescription: product[
                                                          'productDescription'],
                                                      productImage: product[
                                                          'productImage'],
                                                      productPhone: ''));
                                            }
                                            // if (_formKey.currentState!
                                            //         .validate() &&
                                            //     isSelected != -1) {
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
                                            //           builder: (context) =>
                                            //               const MyFavoriteList(),
                                            //         ),
                                            //       );
                                            //     },
                                            //   );
                                            // }
                                          },
                                          icon: Icon(Icons.favorite_border)),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        )),
                  ]),
                );
              },
            );
          }
        },
      ),
    );
  }

  void showErrorDialog(BuildContext context, Text text) {}
}

//  void showErrorDialog(BuildContext context, Text text) {}

// Future<void> createCart() async {
//   var cart;
//   var user;
//   FirebaseFirestore.instance.collection('Cart').doc('cart.productTitle').set({
//     'cartID': cart.productTitle,
//     'id': user!.uid,
//   }, SetOptions(merge: true));

//   FirebaseFirestore.instance
//       .collection('Cart')
//       .doc('Cart')
//       .collection('all')
//       .doc()
//       .set({
//     'cartID': cart.productTitle,
//   }, SetOptions(merge: true));
// }
