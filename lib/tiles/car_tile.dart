import 'package:challenge/stores/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartTile extends StatefulWidget {
  @override
  _CartTileState createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    CartStore cartStore;
    cartStore = Provider.of<CartStore>(context);

    final _controller = ScrollController();

    Future.delayed(Duration(milliseconds: 50), () {
      _controller.animateTo(
        _controller.position.maxScrollExtent,
        duration: Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
      );
    });

    return ListView.builder(
        controller: _controller,
        itemCount: cartStore.productCartList.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8.0),
                width: 120.0,
                child: Image.asset(
                  'assets/images/${cartStore.productCartList[index]['image']}',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        cartStore.productCartList[index]['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17.0),
                      ),
                      Text(
                        'R\$ ${cartStore.productCartList[index]['price']}',
                        style: TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.remove,
                            ),
                            onPressed:
                                cartStore.productCartList[index]['quantity'] > 1
                                    ? () {
                                        setState(() {
                                          cartStore.decQuantity(index);
                                          cartStore.getProductsPrice();
                                        });
                                      }
                                    : null,
                          ),
                          Text(cartStore.productCartList[index]['quantity']
                              .toString()),
                          IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.yellowAccent,
                            ),
                            color: Theme.of(context).primaryColor,
                            onPressed: () {
                              setState(() {
                                cartStore.inQuantity(index);
                                cartStore.getProductsPrice();
                              });
                            },
                          ),
                          FlatButton(
                            child: Text('Remover'),
                            textColor: Colors.grey[500],
                            onPressed: () {
                              setState(() {
                                cartStore.removeProduct(
                                    name: cartStore.productCartList[index]
                                        ['name'],
                                    index: index);
                                cartStore.getProductsPrice();
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        });
  }
}
