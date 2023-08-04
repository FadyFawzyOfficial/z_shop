import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './cart_item_screen.dart';
import '../blocs/cart/cart_bloc.dart';
import '../blocs/cart/cart_states.dart';
import '../models/cart_item.dart';

class CartScreen extends StatelessWidget {
  static final String route = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: BlocBuilder<CartCubit, CartState>(
          buildWhen: (prev, current) =>
              current is LoadingCart ||
              current is CartLoaded ||
              (current is CartFailure && current is LoadingCart) ||
              current is RemovingFromToCart,
          builder: (ctx, state) {
            if (state is LoadingCart || state is RemovingFromToCart)
              return Center(child: CircularProgressIndicator());
            else if (state is CartLoaded) {
              if (state.items.length > 0)
                return _CartItemsWidget(state.items);
              else
                return Center(
                  child: Image.asset(
                    'assets/images/cartEmpty.png',
                    width: 400,
                    height: 400,
                  ),
                );
            } else if (state is CartFailure) {
              return Center(
                child: Image.asset(
                  'assets/images/sorry.png',
                  width: 200,
                  height: 200,
                ),
              );
            }

            return Container();
          }),
    );
  }
}

class _CartItemsWidget extends StatelessWidget {
  final List<CartItem> items;
  const _CartItemsWidget(this.items);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (ctx, idx) => Column(
                    children: <Widget>[
                      GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed(
                              CartItemScreen.route,
                              arguments: items[idx]),
                          child: CartItemWidget(item: items[idx])),
                      Divider(
                        height: 0,
                        thickness: 1,
                        indent: 8,
                        endIndent: 8,
                      )
                    ],
                  )),
        ),
        Container(
          padding: const EdgeInsets.only(left: 16),
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Row(
              children: <Widget>[
                Text(
                  "Total: ${items.fold(0, (value, element) => value + element.total).toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                FlatButton(
                    onPressed: () =>
                        BlocProvider.of<CartCubit>(context).placeOrder(),
                    child: const Text('ORDER',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold)))
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({@required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.id),
      background: Container(
          color: Colors.red,
          child: Row(
            children: <Widget>[
              const Spacer(),
              const Icon(Icons.delete_forever, color: Colors.white, size: 30,),
              const SizedBox(width: 8)
            ],
          )),
      onDismissed: (_) =>
          BlocProvider.of<CartCubit>(context).removeFromCart(item),
      direction: DismissDirection.endToStart,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                item.image,
                width: 70,
                height: 70,
              ),
              const SizedBox(width: 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(item.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text.rich(TextSpan(
                      text: item.price,
                      style:
                          TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                      children: [
                        TextSpan(
                            text: ' x ',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                            children: [TextSpan(text: item.count.toString())])
                      ])),
                ],
              ),
              const Spacer(),
              Text(item.total.toString(),
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
