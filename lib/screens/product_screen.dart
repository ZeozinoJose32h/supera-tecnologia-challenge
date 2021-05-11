import 'package:challenge/screens/cart_screen.dart';
import 'package:challenge/stores/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  List product;
  int index;

  ProductScreen(this.product, this.index);

  @override
  Widget build(BuildContext context) {
    final cartStore = Provider.of<CartStore>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(product[index].name),
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              'assets/images/${product[index].image}',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(7.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        product[index].name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25.0,
                        ),
                      ),
                      Text(
                        product[index].price.toStringAsFixed(2),
                        style: TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 27.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 46.0,
                  child: ElevatedButton(
                    onPressed: () {
                      cartStore.addNewProduct(
                        name: product[index].name,
                        price: product[index].price,
                        image: product[index].image,
                        id: product[index].id,
                      );

                      if (cartStore.inList) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 1),
                            backgroundColor: Colors.red,
                            content: Text(
                              'Produto já está no carrinho',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                        cartStore.inList = false;
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 1),
                            backgroundColor: Colors.green,
                            content: Text(
                              'Produto adicionado',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CartScreen()));
                    },
                    child: Text(
                      'Adicionar ao carrinho',
                    ),
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontSize: 18.0)),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Descrição',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Score ${product[index].score}',
                  style: TextStyle(fontSize: 16.0),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
