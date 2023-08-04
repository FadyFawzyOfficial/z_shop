import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/cart_bloc.dart';
import '../blocs/product/product_bloc.dart';
import '../blocs/product/product_states.dart';
import '../models/product.dart';
import '../widgets/discount_widget.dart';
import '../widgets/product_price_widget.dart';

class ProductScreen extends StatelessWidget {
  static final String route = '/product';

  final String name;

  const ProductScreen(this.name);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      buildWhen: (prev, curr) =>
          curr is LoadingProduct || curr is ProductLoaded,
      builder: (ctx, state) {
        if (state is ProductLoaded)
          return _ProductWidget(state.product);
        else
          return Scaffold(
            appBar: AppBar(title: Text(name)),
            body: const Center(child: CircularProgressIndicator()),
          );
      },
    );
  }
}

class _ProductWidget extends StatelessWidget {
  final Product product;

  _ProductWidget(this.product);

  @override
  Widget build(BuildContext context) {
    Product product = this.product;

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      floatingActionButton: AddToCartButton(product: product),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(children: [
                Image.asset(product.image, width: 400, height: 300),
                if (product.discountPrice != null) DiscountWidget()
              ]),
              const SizedBox(height: 16),
              const Text('Details',
                  style: TextStyle(fontSize: 26, fontFamily: 'Alata')),
              const SizedBox(height: 8),
              BlocBuilder<ProductCubit, ProductState>(
                buildWhen: (p, c) => c is ProductUpdated,
                builder: (ctx, state) {
                  if (state is ProductUpdated) product = state.product;
                  return Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            width: 80,
                            child: const Text('Price',
                                style: TextStyle(fontSize: 18)),
                          ),
                          const SizedBox(width: 16),
                          ProductPriceWidget(product.price,
                              discountPrice: product.discountPrice),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 80,
                            child: const Text(
                              'Delivery',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Text.rich(
                              TextSpan(text: 'Expected on ', children: [
                            TextSpan(
                                text: 'Today, 2 pm - 5 pm',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ])),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Divider(thickness: 2),
                      const SizedBox(height: 16),
                      ShopsWidget(product),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShopsWidget extends StatelessWidget {
  const ShopsWidget(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Shops',
          style: TextStyle(fontSize: 26, fontFamily: 'Alata'),
        ),
        if (product.shops.length > 0)
          ...product.shops
              .map((e) => Column(
                    children: <Widget>[
                      _ProductShopWidget(
                          item: e, isSelected: product.price == e.price),
                      const SizedBox(height: 4),
                      Divider(thickness: 2, indent: 4, endIndent: 4)
                    ],
                  ))
              .toList()
        else
          Center(
              child: Image.asset('assets/images/sorry.png',
                  width: 200, height: 200))
      ],
    );
  }
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    @required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () => BlocProvider.of<CartCubit>(context).addToCart(product),
        child: Icon(Icons.add_shopping_cart));
  }
}

class _ProductShopWidget extends StatelessWidget {
  const _ProductShopWidget({@required this.item, this.isSelected = false});

  final ProductShop item;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          BlocProvider.of<ProductCubit>(context).selectShop(item);
        }
      },
      child: Card(
        elevation: isSelected ? 8 : 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                item.image,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 32),
              ProductPriceWidget(item.price, discountPrice: item.discountPrice),
              const Spacer(),
              if (isSelected) const DiscountWidget(text: 'Selected')
            ],
          ),
        ),
      ),
    );
  }
}
