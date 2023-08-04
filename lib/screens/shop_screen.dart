import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/shop/shop_bloc.dart';
import '../blocs/shop/shop_states.dart';
import '../models/shop.dart';

class ShopScreen extends StatelessWidget {
  final String name;

  ShopScreen(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(name)),
        body: BlocBuilder<ShopCubit, ShopState>(
          builder: (ctx, state) {
            if (state is LoadingShop)
              return Center(
                child: const CircularProgressIndicator(),
              );
            else if (state is ShopInitial || state is ShopLoaded) {
              Shop shop = state is ShopInitial
                  ? state.shop
                  : (state as ShopLoaded).shop;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(shop.image, width: 400, height: 300),
                        const SizedBox(height: 16),
                        const Text('Items',
                            style:
                                TextStyle(fontSize: 26, fontFamily: 'Alata')),
                        const SizedBox(height: 8),
                        if (state is LoadingShop)
                          const Center(child: CircularProgressIndicator())
                        else
                          ...shop.items
                              .map((e) => ListTile(
                                    leading: Image.asset(e.image,
                                        width: 60, height: 60),
                                    title: Text(e.name),
                                    trailing: Text(e.price),
                                  ))
                              .toList()
                      ]),
                ),
              );
            } else
              return Center(
                child: Image.asset(
                  'assets/images/sorry.png',
                  width: 200,
                  height: 200,
                ),
              );
          },
        ));
  }
}
