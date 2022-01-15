import 'dart:convert';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:thenex_webcatalog/model/product/product.dart';
import 'package:thenex_webcatalog/model/product/product_repo.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  ShoppingCartBloc() : super(const ShoppingCartState([])) {
    on<AddToShoppingCartEvent>((event, emit) {
      final newState = List<Product>.from(state.shoppingList);
      newState.add(event.product);
      _localStorage["shopping_cart"] =
          jsonEncode(newState.map((e) => e.artikelnummer).toList());
      emit(ShoppingCartState(newState));
    });
    on<RemoveFromShoppingCartEvent>((event, emit) {
      final index = state.shoppingList.indexOf(event.product);
      final newList = List<Product>.from(state.shoppingList);
      newList.removeAt(index);
      final newState = state.copyWith(shoppingList: newList);
      _localStorage["shopping_cart"] =
          jsonEncode(newList.map((e) => e.artikelnummer).toList());
      emit(newState);
    });
    on<LoadFromStorageEvent>((event, emit) async {
      var shoppingList = await loadFromStorage();
      final newState = state.copyWith(shoppingList: shoppingList);
      emit(newState);
    });
  }

  final Storage _localStorage = window.localStorage;
  Future<List<Product>> loadFromStorage() async {
    if (!_localStorage.containsKey("shopping_cart")) return const [];
    var prodIds = _localStorage["shopping_cart"];
    var listIds = List<String>.from(jsonDecode(prodIds!));
    if (listIds.isEmpty) return const [];
    var products = await ProductRepo().fetchProductsById(listIds);
    return products;
  }
}
