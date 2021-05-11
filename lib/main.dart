import 'package:challenge/screens/home_screen.dart';
import 'package:challenge/stores/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<CartStore>(
      create: (_) => CartStore(),
      child: MaterialApp(
        title: 'Flutter challenge',
        theme: ThemeData(
            backgroundColor: Colors.white,
            brightness: Brightness.dark,
            primaryColor: Colors.deepPurple,
            accentColor: Colors.deepPurple[900],
            dialogBackgroundColor: Colors.blueAccent[100],
            textSelectionColor: Colors.white,
            textSelectionHandleColor: Colors.cyan),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
