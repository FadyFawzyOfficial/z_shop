import '../../models/product.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class LoadingProduct extends ProductState {}

class ProductLoaded extends ProductState {
  final Product product;

  ProductLoaded(this.product);
}

class ProductUpdated extends ProductState {
  final Product product;

  ProductUpdated(this.product);
}

class LoadingProductFailed extends ProductState {
  final String cause;

  LoadingProductFailed(this.cause);
}
