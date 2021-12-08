import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:thenex_webcatalog/model/product/product.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  ShoppingCartBloc() : super(const ShoppingCartState([])) {
    on<AddToShoppingCartEvent>((event, emit) {
      final newState = List<Product>.from(state.shoppingList);
      newState.add(event.product);
      emit(ShoppingCartState(newState));
    });
    on<RemoveFromShoppingCartEvent>((event, emit) {
      final newState = state.copyWith(
          shoppingList: state.shoppingList
              .where((e) => e.artikelnummer != event.product.artikelnummer)
              .toList());
      emit(newState);
    });
  }
}
