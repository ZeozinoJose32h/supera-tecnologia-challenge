import 'package:challenge/stores/product_store.dart';
import 'package:challenge/tiles/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListProductScreen extends StatefulWidget {
  @override
  _ListProductScreenState createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  ProductStore productStore = ProductStore();

  @override
  void initState() {
    super.initState();
    productStore.json();
  }

  showSingleChoiceDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).accentColor,
            title: Text('Ordenar por:'),
            content: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      child: Text(
                        'A - Z',
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ),
                      onPressed: () {
                        setState(() {
                          productStore.orderList(1);
                          Navigator.of(context).pop();
                        });
                      },
                    ),
                    ElevatedButton(
                      child: Text('Z - A',
                          style:
                              TextStyle(color: Theme.of(context).accentColor)),
                      onPressed: () {
                        setState(() {
                          productStore.orderList(2);
                          Navigator.of(context).pop();
                        });
                      },
                    ),
                    ElevatedButton(
                      child: Text('Preço Crescente',
                          style:
                              TextStyle(color: Theme.of(context).accentColor)),
                      onPressed: () {
                        setState(() {
                          productStore.orderList(3);
                          Navigator.of(context).pop();
                        });
                        ;
                      },
                    ),
                    ElevatedButton(
                      child: Text('Preço Decrescente',
                          style:
                              TextStyle(color: Theme.of(context).accentColor)),
                      onPressed: () {
                        setState(() {
                          productStore.orderList(4);
                          Navigator.of(context).pop();
                        });
                      },
                    ),
                    ElevatedButton(
                      child: Text('Popularidade',
                          style:
                              TextStyle(color: Theme.of(context).accentColor)),
                      onPressed: () {
                        setState(() {
                          productStore.orderList(5);
                          Navigator.of(context).pop();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Ordenar por: ',
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(100),
                    ),
                  ),
                  onPressed: () => showSingleChoiceDialog(context),
                  child: Icon(
                    Icons.more_vert,
                    size: 30,
                  )),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: GridView.builder(
                padding: EdgeInsets.all(4.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  childAspectRatio: 0.65,
                ),
                itemCount: productStore.productsModel.length,
                itemBuilder: (context, index) {
                  return ProductTile(productStore.productsModel, index);
                }),
          ),
        ],
      );
    });
  }
}
