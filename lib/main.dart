import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './blocs/cart/cart_bloc.dart';
import './blocs/products/products_bloc.dart';
import './blocs/shops/shops_bloc.dart';
import './screens/cart_item_screen.dart';
import './screens/cart_screen.dart';
import './screens/home_screen.dart';
import './widgets/shops_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsCubit()..fetchProducts(),
        ),
        BlocProvider(
          create: (ctx) => ShopsCubit(),
        ),
        BlocProvider(
          create: (ctx) => CartCubit()..loadCart(),
        ),
      ],
      child: MaterialApp(
        title: 'ZShop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color(0xff0d569f),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: Colors.white),
        routes: {
          "/": (_) => HomeScreen(),
          CartScreen.route: (_) => CartScreen(),
          ShopsScreen.route: (_) => ShopsScreen(),
          CartItemScreen.route: (_) => CartItemScreen()
        },
      ),
    );
  }
}
