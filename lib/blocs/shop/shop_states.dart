import '../../models/shop.dart';

abstract class ShopState {}

class ShopInitial extends ShopState {
  final Shop shop;

  ShopInitial(this.shop);
}

class LoadingShop extends ShopState {}

class ShopLoaded extends ShopState {
  final Shop shop;

  ShopLoaded(this.shop);
}

class LoadingShopFailed extends ShopState {
  final String cause;

  LoadingShopFailed(this.cause);
}
