import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_store/core/utils/AppColors.dart';
import 'package:secure_store/feature/presentation/data/cubit/auth_cubit.dart';
import 'package:secure_store/feature/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: 'AIzaSyBTtAPzqwge2pHYV2AWPre74tqlZ_GuBEg',
        appId: 'com.example.secure_store',
        messagingSenderId: '79961040325',
        projectId: 'store-12a8f'),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            inputDecorationTheme: InputDecorationTheme(filled: true,
                fillColor: appcolors.whitecolor,
                prefixIconColor: appcolors.primerycolor,
                enabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(23))),
            iconTheme: IconThemeData(color: appcolors.primerycolor),
            backgroundColor: appcolors.whitecolor,
            appBarTheme: AppBarTheme(
              centerTitle: true,
              elevation: 0,
            )),
        home: SplashView(),
        builder: (context, child) {
          return Directionality(textDirection: TextDirection.ltr, child: child!);
        },
      ),
    );
  }
}
