import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constance/color.dart';
import '../data/repostory/popular_product_repo.dart';
import '../models/card_model.dart';
import '../models/product_model.dart';
import 'card_controller.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CardController _card;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int getQuantity() {
    return _quantity;
  }

  int _inCardItem = 0;
  int get inCardItem => _inCardItem + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print('got products');
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      print('error');
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((inCardItem + quantity) < 0) {
      Get.snackbar(
        'Item Count',
        'You Cant Reduce More !',
        backgroundColor: AppColor.mainColor,
        colorText: Colors.white,
      );
      if (_inCardItem > 0) {
        _quantity = -_inCardItem;
        return _quantity;
      }
      return 0;
    } else if ((inCardItem + quantity) > 20) {
      Get.snackbar(
        'Item Count',
        'You Cant Add More !',
        backgroundColor: AppColor.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CardController card) {
    _quantity = 0;
    _inCardItem = 0;
    _card = card;
    var exist = false;
    exist = _card.existInCard(product);
    if (exist) {
      _inCardItem = _card.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
    {
      _card.addItem(product, _quantity);
      _quantity = 0;
      _inCardItem = _card.getQuantity(product);
      _card.items.forEach((key, value) {

      });
      update();
    }
  }

  int get totalItems {
    return _card.totalItem;
  }

  List<CardModel> get getItems{
    return _card.getItems;

  }
}
