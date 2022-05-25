import 'package:get/get.dart';
import '../data/repostory/recommended_producct_repo.dart';
import '../models/product_model.dart';
class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic>_recommendedProductList=[];
  List<dynamic> get recommendedProductList=>_recommendedProductList;
  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;
  Future<void>getRecommendedProductList()async{
    Response response= await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200){
      print('Recommended products');
      _recommendedProductList=[];
      recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded=true;
      update();
    }else{
      print('error');

    }

  }


}