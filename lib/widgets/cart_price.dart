import 'package:challenge/stores/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CartPrice extends StatefulWidget {
  @override
  _CartPriceState createState() => _CartPriceState();
}

class _CartPriceState extends State<CartPrice> {
  @override
  Widget build(BuildContext context) {
    CartStore cartStore;
    cartStore = Provider.of<CartStore>(context);

    return Observer(builder: (_) {
      return Card(
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Resumo do pedido',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Itens'),
                  Text(
                    '${cartStore.productCartList.length}',
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('SubTotal'),
                  Text(
                    'R\$ ${cartStore.subTotal.toStringAsFixed(2)}',
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Text('Desconto'), Text('R\$ 0')],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Entrega'),
                  Text(cartStore.subTotal > 250
                      ? 'FRETE GRATIS'
                      : 'R\$ ${cartStore.ship.toStringAsFixed(2)}')
                ],
              ),
              Divider(),
              SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    cartStore.subTotal > 250
                        ? 'R\$ ${(cartStore.total - cartStore.ship).toStringAsFixed(2)}'
                        : '${cartStore.total.toStringAsFixed(2)}',
                    style:
                        TextStyle(color: Colors.yellowAccent, fontSize: 16.0),
                  )
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              RaisedButton(
                child: Text('Finalizar pedido'),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: () {},
              )
            ],
          ),
        ),
      );
    });
  }
}
