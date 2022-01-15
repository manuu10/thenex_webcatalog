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

  Map<Product, int> productCount() {
    Map<Product, int> map = Map<Product, int>();
    for (var item in shoppingList) {
      if (map.containsKey(item)) {
        map[item] = map[item]! + 1;
      } else {
        map[item] = 1;
      }
    }
    return map;
  }
}
