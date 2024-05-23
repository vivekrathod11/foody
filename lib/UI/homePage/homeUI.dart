import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_demo/UI/cartPage/cartUi.dart';
import 'package:shopping_demo/UI/homePage/homeController.dart';
import 'package:shopping_demo/utils/appColors.dart';
import 'package:shopping_demo/utils/appFonts.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';





class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  HomeController homeController = Get.put(HomeController());

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
        toolbarHeight: 94,
        title: SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const Padding(
                padding: EdgeInsets.only(left: 0.0),
                child: Text(
                   "Foodies",
                   style: TextStyle(
                     color: AppColors.whiteColor,
                     fontWeight: FontWeight.w600,
                     fontSize: 20,
                     fontFamily: AppFonts.primaryFont
                   ),
                 ),
              ),
              searchField()
            ],
          ),
        ),
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/splash.jpg'),
                fit: BoxFit.cover
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                const Padding(
                   padding: EdgeInsets.only(left: 15.0),
                   child: Text(
                    "List of Recipes",
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        fontFamily: AppFonts.primaryFont
                    ),
                             ),
                 ),
                Expanded(
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15,left: 15),
                      child: Obx(() =>
                         ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(top: 10),
                          itemCount: homeController.data.length,
                            itemBuilder: (context,index){
                            var items = homeController.data.value[index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.teritary,
                                ),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: SizedBox(
                                        height: 45,
                                        child:  Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(100),
                                                child: CachedNetworkImage(
                                                  imageUrl: items.image.toString(),
                                                  errorWidget: (context, url, error) =>
                                                  const Icon(Icons.error),
                                                  width: 40,
                                                  height: 40,),
                                              )
                                            ),
                                             Padding(
                                              padding: const EdgeInsets.only(left: 18.0),
                                              child: Text(
                                                items.name.toString(),
                                                style: const TextStyle(
                                                    color: AppColors.blackColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                    fontFamily: AppFonts.primaryFont
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                     Padding(
                                      padding: const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        items.cuisine.toString(),
                                        style: const TextStyle(
                                            color: AppColors.blackColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            fontFamily: AppFonts.primaryFont
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ),
                            );
                          }
                        ),
                      ),
                    ),
                  ),
                ),
               const Padding(
                  padding: EdgeInsets.only(left: 15.0,top: 15),
                  child: Text(
                    "Your Favorites",
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        fontFamily: AppFonts.primaryFont
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                    child: gridItems()),
                const SizedBox(height: 30,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget searchField() {
    return Material(
      borderRadius: BorderRadius.circular(5),
      elevation: 2,
      child: Container(
        height: 40,
        width: 400,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
        ),
        child: TextField(
          controller: searchController,
          maxLines: 1,
          style: const TextStyle(
              color: AppColors.blackColor,
              fontFamily: AppFonts.primaryFont,
              fontWeight: FontWeight.w400,
              height: 1
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
            labelText: "Search your food ...",
            labelStyle: const TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
              fontSize: 12,
            ),
            // suffixIcon:
            prefixIcon: const Icon(
                Icons.search_sharp,
                color: AppColors.primaryColor,
                size: 20
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: AppColors.primaryColor
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: AppColors.whiteColor
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: AppColors.whiteColor
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }

  Widget gridItems() {
    return Obx(() =>
       ListView.builder(
         itemCount: homeController.data.length,
           padding: const EdgeInsets.only(top: 15,right: 10,left: 10) ,
           scrollDirection: Axis.horizontal,
           itemBuilder: (context, index) {
           var items = homeController.data.value[index];
             return Padding(
               padding: const EdgeInsets.only(left: 10.0,),
               child: Container(
                 height: 250,
                 width: 170,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: AppColors.gridColor
                 ),
                 child: Padding(
                   padding: const EdgeInsets.only(left: 10.0,right: 10),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       ClipRRect(
                         borderRadius: BorderRadius.circular(5),
                         child: CachedNetworkImage(
                           imageUrl: items.image.toString(),
                           errorWidget: (context, url, error) =>
                           const Icon(Icons.error),
                           width: 150,
                           height: 80,
                           fit: BoxFit.cover,
                         ),
                       ),
                       Text(
                         items.name.toString(),
                         style: const TextStyle(
                             color: AppColors.blackColor,
                             fontWeight: FontWeight.w700,
                             fontSize: 16,
                             fontFamily: AppFonts.primaryFont
                         ),
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text(
                             '\$ ${items.reviewCount}',
                             style: const TextStyle(
                                 color: AppColors.blackColor,
                                 fontWeight: FontWeight.w700,
                                 fontSize: 16,
                                 fontFamily: AppFonts.primaryFont
                             ),
                           ),
                           SizedBox(
                             width: 50,
                             height: 20,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,// Align items in the center
                               children: [
                                const Icon(
                                   Icons.star,
                                   color: AppColors.starColor,
                                   size: 16, // Adjust size as needed
                                 ),
                                const SizedBox(width: 5), // Add spacing between icon and text
                                 Text(
                                   items.rating.toString(),
                                   style: const TextStyle(
                                       color: AppColors.blackColor,
                                       fontWeight: FontWeight.w700,
                                       fontSize: 14,
                                       fontFamily: AppFonts.primaryFont
                                   ),
                                 ),
                               ],
                             ),
                           )
                         ],
                       ),
                       GestureDetector(
                         behavior: HitTestBehavior.translucent,
                         onTap: (){
                           Get.to(() => const CartScreen(),
                               arguments: [items.image,items.name,items.reviewCount,items.cuisine,items.rating]
                           );
                         },
                         child: Container(
                           height: 25,
                           width: 90,
                           decoration: BoxDecoration(
                             color: AppColors.colorRed,
                             borderRadius: BorderRadius.circular(5)
                           ),
                           child: const Center(
                             child: Text(
                               "Add to cart",
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
             );
           }
       ),
    );
  }
}
