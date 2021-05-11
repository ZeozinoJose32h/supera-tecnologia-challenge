// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductStore on _ProductStore, Store {
  final _$productsModelAtom = Atom(name: '_ProductStore.productsModel');

  @override
  List<ProductModel> get productsModel {
    _$productsModelAtom.reportRead();
    return super.productsModel;
  }

  @override
  set productsModel(List<ProductModel> value) {
    _$productsModelAtom.reportWrite(value, super.productsModel, () {
      super.productsModel = value;
    });
  }

  final _$jsonAsyncAction = AsyncAction('_ProductStore.json');

  @override
  Future json() {
    return _$jsonAsyncAction.run(() => super.json());
  }

  final _$_ProductStoreActionController =
      ActionController(name: '_ProductStore');

  @override
  dynamic orderList(int result) {
    final _$actionInfo = _$_ProductStoreActionController.startAction(
        name: '_ProductStore.orderList');
    try {
      return super.orderList(result);
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productsModel: ${productsModel}
    ''';
  }
}
