import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:secure_store/core/utils/AppColors.dart';
import 'package:secure_store/feature/screens/bottomNavBar.dart';
import 'package:secure_store/feature/home/auth/loginView.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  User? user;
  Future<void> _getUser() async {
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  void initState() {
    super.initState();
    _getUser();
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
              (user != null) ? const NavBar() : const loginView()
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:appcolors.primerycolor ,
      body: Center(
        child: Lottie.asset('assets/secure.json'
        ,width: 250,height: 300),
      ),
    );
  }
}