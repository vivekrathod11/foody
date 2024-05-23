import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:shopping_demo/apiService/apiService.dart';
import 'package:shopping_demo/beans/response/recipeResponse.dart';






class HomeController extends GetxController {


  late ApiService apiService;
  late Dio dio;
  late RecipeResponse recipeResponse;



  //variales

  var data = <Recipes>[].obs;



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


  Future<void> getData() async {

    final dio = Dio();
    final apiService = ApiService(dio);
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

    final response = await apiService.fetchOnboardingData();
    recipeResponse = response;

    if(recipeResponse != null){
      data.value = recipeResponse.recipes!;
    }
    else{
      print("api fail");
    }
  }
}