// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStore, Store {
  final _$productCartListAtom = Atom(name: '_CartStore.productCartList');

  @override
  List<dynamic> get productCartList {
    _$productCartListAtom.reportRead();
    return super.productCartList;
  }

  @override
  set productCartList(List<dynamic> value) {
    _$productCartListAtom.reportWrite(value, super.productCartList, () {
      super.productCartList = value;
    });
  }

  final _$shipAtom = Atom(name: '_CartStore.ship');

  @override
  double get ship {
    _$shipAtom.reportRead();
    return super.ship;
  }

  @override
  set ship(double value) {
    _$shipAtom.reportWrite(value, super.ship, () {
      super.ship = value;
    });
  }

  final _$totalAtom = Atom(name: '_CartStore.total');

  @override
  double get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(double value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  final _$subTotalAtom = Atom(name: '_CartStore.subTotal');

  @override
  double get subTotal {
    _$subTotalAtom.reportRead();
    return super.subTotal;
  }

  @override
  set subTotal(double value) {
    _$subTotalAtom.reportWrite(value, super.subTotal, () {
      super.subTotal = value;
    });
  }

  final _$_getFileAsyncAction = AsyncAction('_CartStore._getFile');

  @override
  Future<File> _getFile() {
    return _$_getFileAsyncAction.run(() => super._getFile());
  }

  final _$_saveDataAsyncAction = AsyncAction('_CartStore._saveData');

  @override
  Future<File> _saveData() {
    return _$_saveDataAsyncAction.run(() => super._saveData());
  }

  final _$_CartStoreActionController = ActionController(name: '_CartStore');

  @override
  void addNewProduct({String name, double price, String image, int id}) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.addNewProduct');
    try {
      return super
          .addNewProduct(name: name, price: price, image: image, id: id);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productCartList: ${productCartList},
ship: ${ship},
total: ${total},
subTotal: ${subTotal}
    ''';
  }
}
