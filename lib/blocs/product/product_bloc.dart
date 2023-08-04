import 'package:flutter_bloc/flutter_bloc.dart';

import './product_states.dart';
import '../../api/api.dart';
import '../../models/product.dart';

class ProductCubit extends Cubit<ProductState> {
  Product product;

  ProductCubit() : super(ProductInitial());

  void fetchProduct(String id) async {
    emit(LoadingProduct());

    try {
      product = await Api.fetchProduct(id);

      emit(ProductLoaded(product));
    } catch (ex) {
      emit(LoadingProductFailed(ex.message));
    }
  }

  void selectShop(ProductShop item) async {
    try {
      product.price = item.price;
      product.discountPrice = item.discountPrice;

      emit(ProductUpdated(product));
    } catch (ex) {
      emit(LoadingProductFailed(ex.message));
    }
  }
}
