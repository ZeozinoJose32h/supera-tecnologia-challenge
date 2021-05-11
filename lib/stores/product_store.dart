import 'dart:convert';
import 'package:challenge/api/products.dart';
import 'package:challenge/models/products_model.dart';
import 'package:mobx/mobx.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {
  @observable
  var productsModel = new List<ProductModel>();

  _ProductStore() {
    autorun() {
      print(productsModel);
    }
  }

  @action
  json() async {
    List<dynamic> data = jsonDecode(await getJson());
    productsModel = data.map((model) => ProductModel.fromJson(model)).toList();
  }

  @action
  orderList(int result) {
    switch (result) {
      case 1:
        productsModel.sort((a, b) {
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
        });
        break;
      case 2:
        productsModel.sort((b, a) {
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
        });
        break;
      case 3:
        productsModel.sort((a, b) {
          return a.price.compareTo(b.price);
        });
        break;
      case 4:
        productsModel.sort((b, a) {
          return a.price.compareTo(b.price);
        });
        break;
      case 5:
        productsModel.sort((b, a) {
          return a.score.compareTo(b.score);
        });
        break;
    }
  }
}
