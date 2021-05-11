import 'package:challenge/screens/list_product_screen.dart';
import 'package:challenge/widgets/cart_button.dart';
import 'package:challenge/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: ListProductScreen(),
          backgroundColor: Theme.of(context).accentColor,
          drawer: CustomDrawer(_pageController),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: ListProductScreen(),
          backgroundColor: Theme.of(context).accentColor,
          drawer: CustomDrawer(_pageController),
          floatingActionButton: CartButton(),
        ),
      ],
    );
  }
}
