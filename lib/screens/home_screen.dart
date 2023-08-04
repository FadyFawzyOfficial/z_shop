import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './product_screen.dart';
import '../blocs/cart/cart_bloc.dart';
import '../blocs/product/product_bloc.dart';
import '../blocs/products/products_bloc.dart';
import '../blocs/products/products_states.dart';
import '../blocs/shops/shops_bloc.dart';
import '../models/product.dart';
import '../widgets/cart_icon_widget.dart';
import '../widgets/discount_widget.dart';
import '../widgets/product_price_widget.dart';
import '../widgets/shops_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZShop'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.shop),
              onPressed: () {
                BlocProvider.of<ShopsCubit>(context).fetchShops();
                Navigator.of(context).pushNamed(ShopsScreen.route);
              }),
          CartIconWidget(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (ctx, state) {
            if (state is ProductsLoaded)
              return GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.62,
                  children: state.products.map((e) => ProductCard(e)).toList());
            else if (state is ProductsLoading)
              return Center(child: CircularProgressIndicator());
            else if (state is ProductsLoadingFailure)
              return Center(child: Text(state.cause));

            return Container();
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    final bool discount = product.discountPrice != null;

    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => BlocProvider<ProductCubit>(
                create: (_) => ProductCubit()..fetchProduct(product.id),
                child: ProductScreen(product.name),
              ))),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 4),
              if (discount) DiscountWidget() else const SizedBox(height: 34),
              const SizedBox(height: 4),
              Center(
                  child: Image.asset(
                product.image,
                width: 100,
                height: 100,
              )),
              const SizedBox(height: 12),
              SizedBox(
                height: 35,
                child: Text(
                  product.name,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ProductPriceWidget(
                product.price,
                discountPrice: product.discountPrice,
              ),
              const Spacer(flex: 2),
              Center(
                child: Container(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () =>
                        BlocProvider.of<CartCubit>(context).addToCart(product),
                    color: Colors.red,
                    textColor: Colors.white,
                    child: const Text('Add To Cart'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
