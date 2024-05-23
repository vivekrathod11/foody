import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shopping_demo/UI/homePage/homeController.dart';
import 'package:shopping_demo/UI/homePage/homeUI.dart';
import 'package:shopping_demo/utils/appColors.dart';
import 'package:shopping_demo/utils/appFonts.dart';
import 'package:get/get.dart';






class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getData();
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomeScreen()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/splash.jpg'),
              fit: BoxFit.cover,
          )
        ),
        child: const Center(
          child: Text(
            "Foodies",
            style: TextStyle(
                color: AppColors.whiteColor,
                fontFamily: AppFonts.primaryFont,
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}

