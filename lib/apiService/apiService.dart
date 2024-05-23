import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopping_demo/beans/response/recipeResponse.dart';
import 'package:shopping_demo/utils/constants.dart';
part 'apiService.g.dart';



@RestApi(baseUrl: Constants.BASE_URL)
abstract class ApiService {
  factory ApiService (Dio dio ,{String baseUrl}) = _ApiService;

  final dio = Dio();
  static ApiService create () {
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(requestBody: true,responseBody: true));
    return ApiService(dio);
  }



  @GET(Constants.RECIPE)
  Future<RecipeResponse>fetchOnboardingData();
}