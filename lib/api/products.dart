import 'package:flutter/services.dart';

Future<String> getJson() {
  return rootBundle.loadString('assets/products.json');
}
