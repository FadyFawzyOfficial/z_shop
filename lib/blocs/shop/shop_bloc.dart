import 'package:flutter_bloc/flutter_bloc.dart';

import './shop_states.dart';
import '../../api/api.dart';
import '../../models/shop.dart';

class ShopCubit extends Cubit<ShopState> {
  Shop shop;

  ShopCubit(this.shop) : super(ShopInitial(shop));

  void fetchShop(String id) async {
    emit(LoadingShop());

    try {
      Shop shop = await Api.fetchShop(id);

      emit(ShopLoaded(shop));
    } catch (ex) {
      emit(LoadingShopFailed(ex.message));
    }
  }
}
