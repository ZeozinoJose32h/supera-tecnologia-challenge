
import 'package:challenge/stores/cart_store.dart';
import 'package:challenge/tiles/car_tile.dart';
import 'package:challenge/widgets/cart_price.dart';
import 'package:challenge/widgets/discount_card.dart';
import 'package:challenge/widgets/ship_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartStore cartStore;

  @override
  void initState() {
    super.initState();
    cartStore = Provider.of<CartStore>(context, listen: false);
    cartStore.read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Carrinho'),
        actions: <Widget>[
          Container(
              padding: EdgeInsets.only(right: 8.0),
              alignment: Alignment.center,
              child: Text('Itens'))
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: CartTile(),
              ),
              DiscountCard(),
              ShipCard(),
              CartPrice(),
            ],
          )
        ],
      ),
    );
  }
}
