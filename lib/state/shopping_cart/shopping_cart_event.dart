part of 'shopping_cart_bloc.dart';

abstract class ShoppingCartEvent extends Equatable {
  const ShoppingCartEvent();

  @override
  List<Object> get props => [];
}

class AddToShoppingCartEvent extends ShoppingCartEvent {
  final Product product;

  const AddToShoppingCartEvent(this.product);
}

class RemoveFromShoppingCartEvent extends ShoppingCartEvent {
  final Product product;

  const RemoveFromShoppingCartEvent(this.product);
}
