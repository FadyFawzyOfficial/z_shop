import 'package:flutter_bloc/flutter_bloc.dart';

import './cart_states.dart';
import '../../api/api.dart';
import '../../models/cart_item.dart';
import '../../models/product.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void loadCart() async {
    emit(LoadingCart());

    try {
      List<CartItem> items = await Api.loadCart();

      emit(CartLoaded(items));
    } catch (ex) {
      CartFailure(ex.message);
    }
  }

  void addToCart(Product p) async {
    emit(AddingToCart());

    try {
      await Api.addToCart(p);

      emit(AddedToCart());

      loadCart();
    } catch (ex) {
      CartFailure(ex.message);
    }
  }

  void removeFromCart(CartItem item) async {
    emit(RemovingFromToCart());

    try {
      await Api.removeFromCart(item);

      emit(RemovedFromToCart());

      loadCart();
    } catch (ex) {
      CartFailure(ex.message);
    }
  }

  void placeOrder() async {
    try {
      await Api.placeOrder();

      emit(OrderPlaced());

      loadCart();
    } catch (ex) {
      OrderFailure(ex.message);
    }
  }
}
