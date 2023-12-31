import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/api.dart';
import '../../models/shop.dart';
import 'shops_states.dart';

class ShopsCubit extends Cubit<ShopsState> {
  ShopsCubit() : super(LoadingShops());

  void fetchShops() async {
    emit(LoadingShops());

    try {
      List<Shop> shops = await Api.fetchShops();

      emit(ShopsLoaded(shops));
    } catch (ex) {
      emit(LoadingShopsFailure('$ex'));
    }
  }
}
