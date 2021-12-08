part of 'shopping_cart_bloc.dart';

class ShoppingCartState extends Equatable {
  const ShoppingCartState(this.shoppingList);

  final List<Product> shoppingList;

  @override
  List<Object> get props => [shoppingList];

  ShoppingCartState copyWith({
    List<Product>? shoppingList,
  }) {
    return ShoppingCartState(
      shoppingList ?? this.shoppingList,
    );
  }
}
