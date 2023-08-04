import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/shop/shop_bloc.dart';
import '../blocs/shops/shops_bloc.dart';
import '../blocs/shops/shops_states.dart';
import '../screens/shop_screen.dart';

class ShopsScreen extends StatelessWidget {
  static final String route = '/shops';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shops')),
      body: BlocBuilder<ShopsCubit, ShopsState>(
        builder: (ctx, state) {
          if (state is LoadingShops)
            return const Center(
              child: const CircularProgressIndicator(),
            );
          if (state is ShopsLoaded)
            return Column(
              children: state.shops
                  .map((e) => ListTile(
                        leading: Image.asset(e.image, width: 60, height: 60),
                        title:
                            Text(e.name, style: TextStyle(fontFamily: "Alata")),
                        subtitle: Text('${e.items.length.toString()} item(s)'),
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => BlocProvider<ShopCubit>(
                                      create: (_) => ShopCubit(e),
                                      child: ShopScreen(e.name),
                                    ))),
                      ))
                  .toList(),
            );
          else
            return Center(
              child: Image.asset(
                'assets/images/sorry.png',
                width: 200,
                height: 200,
              ),
            );
        },
      ),
    );
  }
}
