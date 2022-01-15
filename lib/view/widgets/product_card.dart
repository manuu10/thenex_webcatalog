import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thenex_webcatalog/app_colors.dart';
import 'package:thenex_webcatalog/model/product/product.dart';
import 'package:thenex_webcatalog/state/shopping_cart/shopping_cart_bloc.dart';
import 'package:thenex_webcatalog/view/widgets/send_request_dialog.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              product.bezeichnung,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Divider(thickness: 2, color: AppColors.primary),
            Expanded(
              child: SelectableText(
                product.beschreibung,
                style: TextStyle(
                  color: AppColors.foreground.withAlpha(200),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      SendRequestDialog.show(context, product);
                    },
                    label: const Text("Request"),
                    icon: const Icon(Icons.send),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                final bloc = context.read<ShoppingCartBloc>();
                                bloc.add(AddToShoppingCartEvent(product));
                              },
                              child: const Icon(Icons.add),
                            ),
                          ),
                          if (state.shoppingList.contains(product))
                            const SizedBox(width: 5),
                          if (state.shoppingList.contains(product))
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  final bloc = context.read<ShoppingCartBloc>();
                                  bloc.add(
                                      RemoveFromShoppingCartEvent(product));
                                },
                                child: const Icon(Icons.remove),
                              ),
                            ),
                          if (state.shoppingList.contains(product))
                            const SizedBox(width: 5),
                          if (state.shoppingList.contains(product))
                            Text(state.shoppingList
                                .where((e) => e == product)
                                .length
                                .toString()),
                        ],
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
