import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/cart_bloc.dart';
import '../blocs/cart/cart_states.dart';
import '../screens/cart_screen.dart';

class CartIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (prev, current) => current is CartLoaded,
      builder: (ctx, state) {
        String count = "0";
        if (state is CartLoaded) count = state.items.length.toString();
        return IconButton(
          icon: Badge(
              badgeContent: Text(
                count,
                style: TextStyle(color: Colors.white),
              ),
              child: Icon(Icons.shopping_cart)),
          onPressed: () => Navigator.of(context).pushNamed(CartScreen.route),
        );
      },
    );
  }
}
