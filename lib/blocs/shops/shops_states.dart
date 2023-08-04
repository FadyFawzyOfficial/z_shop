import '../../models/shop.dart';

abstract class ShopsState {}

class LoadingShops extends ShopsState {}

class ShopsLoaded extends ShopsState {
  final List<Shop> shops;

  ShopsLoaded(this.shops);
}

class LoadingShopsFailure extends ShopsState {
  final String cause;

  LoadingShopsFailure(this.cause);
}
