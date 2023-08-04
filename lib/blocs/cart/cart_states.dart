import '../../models/cart_item.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class LoadingCart extends CartState {}

class CartLoaded extends CartState {
  final List<CartItem> items;

  CartLoaded(this.items);
}

class AddingToCart extends CartState {}

class AddedToCart extends CartState {}

class RemovingFromToCart extends CartState {}

class RemovedFromToCart extends CartState {}

class OrderPlaced extends CartState {}

class CartFailure extends CartState {
  final String cause;

  CartFailure(this.cause);
}

class OrderFailure extends CartState {
  final String cause;

  OrderFailure(this.cause);
}
