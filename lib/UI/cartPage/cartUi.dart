import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_demo/UI/homePage/homeUI.dart';
import 'package:shopping_demo/utils/appColors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shopping_demo/utils/appFonts.dart';






class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var data = Get.arguments;
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        foregroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: AppColors.primaryColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: SizedBox(
          height: 50,
          child: Row(
            children: [
              IconButton(
                onPressed: (){
                  Get.back();
                },
                icon: const Icon(
                    Icons.arrow_back_ios,
                size: 20,
                color: AppColors.whiteColor,
                ),
              ),
              const Text(
                "Cart",
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    fontFamily: AppFonts.primaryFont
                ),
              ),
            ],
          ),
        ),
      ),
      body: isDone ?
      const Center(child:  CircularProgressIndicator(color: Colors.red,)) :
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/splash.jpg'),
                fit: BoxFit.cover
            )
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0,right: 15),
          child: Center(
            child: SizedBox(
              height: 450,
              width: 400,
              child: Card(
                elevation: 2,
                color: AppColors.whiteColor.withOpacity(1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        imageUrl: data[0],
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                        width: 250,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    nameField(),
                    priceField(),
                    typeField(),
                    ratingField(),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (){
                        alert();
                       setState(() {
                         isDone = true;
                       });
                        Future.delayed(const Duration(seconds: 2),(){
                          Get.to(() => const HomeScreen());
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                            color: AppColors.colorRed,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: const Center(
                          child: Text(
                            "CheckOut",
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                fontFamily: AppFonts.primaryFont
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }

  Widget nameField() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10),
      child: Container(
        height: 40,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.teritary
        ),
        child: Form(
          child: TextFormField(
            enabled: false,
            maxLines: 1,
            style: const TextStyle(
              color: AppColors.blackColor,
              fontFamily: AppFonts.primaryFont,
              fontWeight: FontWeight.w400,
              height: 1,
            ),
            cursorColor: AppColors.blackColor,
            textInputAction: TextInputAction.done,
            cursorWidth: 1,
            cursorHeight: 16,
            onChanged: (value) {},
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 15),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: false,
              fillColor: AppColors.primaryColor,
              enabled: true,
              labelText: data[1],  // Add appropriate label text here
              labelStyle: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor,
                fontSize: 12,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.teritary,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.teritary,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget priceField() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10),
      child: Container(
        height: 40,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.teritary
        ),
        child: Form(
          child: TextFormField(
            enabled: false,
            maxLines: 1,
            style: const TextStyle(
              color: AppColors.blackColor,
              fontFamily: AppFonts.primaryFont,
              fontWeight: FontWeight.w400,
              height: 1,
            ),
            cursorColor: AppColors.blackColor,
            textInputAction: TextInputAction.done,
            cursorWidth: 1,
            cursorHeight: 16,
            onChanged: (value) {},
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 15),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: false,
              fillColor: AppColors.primaryColor,
              enabled: true,
              labelText:  '\$ ${data[2]}',  // Add appropriate label text here
              labelStyle: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor,
                fontSize: 12,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.teritary,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.teritary,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget typeField() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10),
      child: Container(
        height: 40,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.teritary
        ),
        child: Form(
          child: TextFormField(
            enabled: false,
            maxLines: 1,
            style: const TextStyle(
              color: AppColors.blackColor,
              fontFamily: AppFonts.primaryFont,
              fontWeight: FontWeight.w400,
              height: 1,
            ),
            cursorColor: AppColors.blackColor,
            textInputAction: TextInputAction.done,
            cursorWidth: 1,
            cursorHeight: 16,
            onChanged: (value) {},
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 15),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: false,
              fillColor: AppColors.primaryColor,
              enabled: true,
              labelText: data[3],  // Add appropriate label text here
              labelStyle: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor,
                fontSize: 12,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.teritary,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.teritary,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget ratingField() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10),
      child: Container(
        height: 40,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.teritary
        ),
        child: Form(
          child: TextFormField(
            enabled: false,
            maxLines: 1,
            style: const TextStyle(
              color: AppColors.blackColor,
              fontFamily: AppFonts.primaryFont,
              fontWeight: FontWeight.w400,
              height: 1,
            ),
            cursorColor: AppColors.blackColor,
            textInputAction: TextInputAction.done,
            cursorWidth: 1,
            cursorHeight: 16,
            onChanged: (value) {},
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 15),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: false,
              fillColor: AppColors.primaryColor,
              enabled: true,
              labelText: data[4].toString(),  // Add appropriate label text here
              labelStyle: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor,
                fontSize: 12,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.teritary,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.teritary,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void alert(){
    Get.snackbar(
        "Congrats",
        'Your order has been placed successfully',
      snackPosition: SnackPosition.BOTTOM,
      colorText: AppColors.whiteColor,
      duration: const Duration(seconds: 2)
    );
  }
}
