import '../../models/product.dart';

abstract class ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;

  ProductsLoaded(this.products);
}

class ProductsLoadingFailure extends ProductsState {
  final String cause;

  ProductsLoadingFailure(this.cause);
}
