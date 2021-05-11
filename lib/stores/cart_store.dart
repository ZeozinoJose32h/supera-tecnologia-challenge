import 'dart:convert';
import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';

part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  @observable
  List productCartList = [];

  bool inList = false;

  @action
  void addNewProduct({String name, double price, String image, int id}) {
    Map<String, dynamic> newProduct = Map();
    newProduct['name'] = name;
    newProduct['price'] = price;
    newProduct['image'] = image;
    newProduct['id'] = id;
    newProduct['quantity'] = 0;

    for (int i = 0; i < productCartList.length; i += 1) {
      if (newProduct['name'] == productCartList[i]['name']) {
        productCartList.removeAt(i);
        inList = true;
      } else {
        //print('unico');
      }
    }
    productCartList.add(newProduct);

    getShipPrice();

    _saveData();
  }

  @action
  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/data.json');
  }

  @action
  Future<File> _saveData() async {
    String data = jsonEncode(productCartList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  void read() {
    readData().then((data) {
      productCartList = jsonDecode(data);
    });
  }

  void removeProduct({String name, int index}) {
    productCartList.removeAt(index);
    cartMap.remove(name);
    getShipPrice();
    getProductsPrice();
    _saveData();
  }

  double valueReal;

  var cartMap = Map();

  void inQuantity(int index) {
    productCartList[index]['quantity']++;
    cartMap[productCartList[index]['name']] =
        productCartList[index]['price'] * productCartList[index]['quantity'];
  }

  void decQuantity(int index) {
    productCartList[index]['quantity']--;
    cartMap[productCartList[index]['name']] =
        productCartList[index]['price'] * (productCartList[index]['quantity']);
  }

  @observable
  double ship = 0;

  void getShipPrice() {
    if (ship >= 1.0) {
      ship = 10.0 * productCartList.length;
    } else {
      ship = 10.0;
    }
  }

  @observable
  double total = 0.0;

  @observable
  double subTotal = 0.0;

  void getProductsPrice() {
    if (cartMap.isEmpty) {
      subTotal = 0.0;
      total = 0.0;
    } else if (cartMap.isNotEmpty) {
      var values = cartMap.values;
      subTotal = values.reduce((p, e) => p + e);
      total = subTotal + ship;
    }
  }
}
