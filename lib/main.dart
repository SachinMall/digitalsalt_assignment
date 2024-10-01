import 'package:digitalsalt_assignment/res/app_colors/colors.dart';
import 'package:digitalsalt_assignment/utils/global_binidings.dart';
import 'package:digitalsalt_assignment/view/auth_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalBindings(),
      theme: ThemeData(
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: AppColor.kwhite,
      appBarTheme: const AppBarTheme(color: AppColor.kwhite,centerTitle: true),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      
      ),
      home: const SplashScreen(),
    );
  }
}
