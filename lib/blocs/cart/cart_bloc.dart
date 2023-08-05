import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../api/api.dart';
import '../../models/cart_item.dart';
import '../../models/product.dart';
import 'cart_states.dart';

class CartCubit extends Cubit<CartState> {
  List<CartItem> _items = [];

  CartCubit() : super(CartInitial());

  void loadCart() async {
    emit(LoadingCart());

    try {
      _items = await Api.loadCart();

      emit(CartLoaded(_items));
    } catch (ex) {
      CartFailure('$ex');
    }
  }

  void addToCart(Product product) async {
    bool isNew = true;
    emit(AddingToCart());

    CartItem item = _items.firstWhere(
      (element) => element.productId == product.id,
      orElse: () => CartItem(
        id: null,
        count: 1,
        productId: product.id,
        name: product.name,
        price: "0",
        image: product.image,
        dateOfPurchase: DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY)
            .format(DateTime.now()),
      ),
    );

    if (item.id != null) {
      isNew = false;
      item.count++;
      item.dateOfPurchase = DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY)
          .format(DateTime.now());
    }

    item.price = product.discountPrice ?? product.price;
    // item.shopId =
    //     product.shops.firstWhere((shop) => shop.price == item.price).shopId;

    try {
      if (isNew) {
        item.id = await Api.addToCart(item);
      } else {
        Api.updateCartItem(item);
      }

      _items.add(item);

      emit(AddedToCart());

      loadCart();
    } catch (ex) {
      CartFailure('$ex');
    }
  }

  void removeFromCart(CartItem item) async {
    emit(RemovingFromToCart());

    try {
      await Api.removeFromCart(item.id!);

      _items.remove(item);

      emit(RemovedFromToCart());

      loadCart();
    } catch (ex) {
      CartFailure('$ex');
    }
  }

  void placeOrder() async {
    try {
      await Api.placeOrder();

      emit(OrderPlaced());

      loadCart();
    } catch (ex) {
      OrderFailure('$ex');
    }
  }
}
