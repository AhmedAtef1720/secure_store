import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String productId;
  final String productTitle;
  final String productPrice;
  final String productCategory;
  final String productDescription;
  final String productPhone;
  final String productImage;
  final String userId;
  final String userName;
  ProductModel(  {
    required this.productPhone,
    required this.productId,
    required this.productTitle,
    required this.productPrice,
    required this.productCategory,
    required this.productDescription,
    required this.productImage,
    required this.userId,
    required this.userName, 
  });

  factory ProductModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return ProductModel(
      productId: data['productId'], //doc.get("productId"),
      productTitle: data['productTitle'],
      productPrice: data['productPrice'],
      productCategory: data['productCategory'],
      productDescription: data['productDescription'],
      productImage: data['productImage'], productPhone: data['productPhone'],
      userName: data['userId'],
      userId: data['userName'], 
    );
  }
}

class CartModel {
  final String cartId;
  final String cartTitle;
  final String cartPrice;
  final String cartCategory;
  final String cartDescription;
  final String cartImage;
  CartModel({
    required this.cartTitle,
    required this.cartPrice,
    required this.cartCategory,
    required this.cartDescription,
    required this.cartImage,
    required this.cartId,
  });

  factory CartModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return CartModel(
      cartId: data['cartId'], //doc.get("productId"),
      cartTitle: data['productTitle'],
      cartPrice: data['productPrice'],
      cartCategory: data['productCategory'],
      cartDescription: data['productDescription'],
      cartImage: data['productImage'],
    );
  }
}
