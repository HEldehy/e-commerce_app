import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constance/color.dart';
import '../data/repostory/card_repo.dart';
import '../models/card_model.dart';
import '../models/product_model.dart';

class CardController extends GetxController {
  final CardRepo cardRepo;
  CardController({required this.cardRepo});
  Map<int, CardModel> _items = {};
  Map<int, CardModel> get items=>_items;


  void addItem(ProductModel product, int quantity) {
    var totalQuantity=0;
    if(_items.containsKey(product.id!)){
      _items.update(product.id!, (value){
        totalQuantity=value.quantity!+quantity;

        return  CardModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity:value.quantity!+quantity,
            isExit: true,
            time: DateTime.now().toString()

        );
      });
      if(totalQuantity <=0){

        items.remove(product.id);
      }



    }else
    {
      if(quantity >0){
        _items.putIfAbsent(product.id!, () {
          return CardModel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              quantity: quantity,
              isExit: true,
              time: DateTime.now().toString());
        });

      }
      else{
          Get.snackbar(
            'Item Count',
            'You should at least Add an item in The Card !',
            backgroundColor: AppColor.mainColor,
            colorText: Colors.white,
          );
      }




    }
  }
 bool existInCard(ProductModel product){
    if (_items.containsKey(product.id)){

      return true;
    }
    return false;

  }
  int getQuantity(ProductModel product){
    var quantity=0;
    if(_items.containsKey(product.id)){
      _items.forEach((key, value) {
        if(key==product.id){
          quantity=value.quantity!;
        }
      });
    }
   return quantity;
  }
  int get totalItem{
    var totalQuantity=0;
    _items.forEach((key, value) {
      totalQuantity+=value.quantity!;
    });
    return totalQuantity;
  }
  List<CardModel> get getItems{
   return
    _items.entries.map((e){
    return  e.value;
    }).toList();
  }




}
