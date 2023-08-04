import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/api.dart';
import '../../blocs/products/products_states.dart';
import '../../models/product.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsLoading());

  void fetchProducts() async {
    emit(ProductsLoading());

    try {
      List<Product> products = await Api.fetchProducts();

      emit(ProductsLoaded(products));
    } catch (ex) {
      emit(ProductsLoadingFailure(ex.message));
    }
  }
}
