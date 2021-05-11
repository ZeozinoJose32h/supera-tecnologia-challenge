import 'package:challenge/screens/product_screen.dart';
import 'package:flutter/material.dart';


class ProductTile extends StatelessWidget {
  List product;
  int index;

  ProductTile(this.product, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductScreen(product, index)));
      },
      child: Card(
          color: Theme.of(context).dialogBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 0.9,
                child: Image.asset(
                  'assets/images/${product[index].image}',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(7.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        product[index].name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        product[index].price.toStringAsFixed(2),
                        style: TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
