import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thenex_webcatalog/app_colors.dart';
import 'package:thenex_webcatalog/state/general/general_bloc.dart';
import 'package:thenex_webcatalog/state/shopping_cart/shopping_cart_bloc.dart';
import 'package:thenex_webcatalog/view/widgets/search_overlay.dart';
import 'package:thenex_webcatalog/view/widgets/shopping_cart_overlay.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/thenex_logo.png",
          height: 100,
        ),
        const SizedBox(height: 20),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            const Text("Home"),
            const SizedBox(width: 10),
            const Text("Products"),
            const SizedBox(width: 10),
            const Text("Supplier"),
            const SizedBox(width: 10),
            const Text("Partners"),
            const SizedBox(width: 10),
            const Text("About us"),
            const SizedBox(width: 10),
            const Text("News"),
            const SizedBox(width: 10),
            const Text("Downloads"),
            const SizedBox(width: 10),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.primary, width: 2),
                ),
              ),
              child: const Text(
                "Webcatalog",
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<GeneralBloc, GeneralState>(
              builder: (context, state) {
                return Row(
                  children: [
                    Text(
                      "CATEGORY / ",
                      style: TextStyle(
                        color: AppColors.foreground.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      state.currentlySelected
                          .getNameWithoutNumber()
                          .toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                );
              },
            ),
            Row(
              children: [
                BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
                  builder: (context, state) {
                    return TextButton.icon(
                        onPressed: () {
                          ShoppingOverlay.show(context);
                        },
                        label: const Icon(Icons.shopping_bag),
                        icon: Text(state.shoppingList.length.toString()));
                  },
                ),
                SizedBox(
                  width: 300,
                  child: BlocBuilder<GeneralBloc, GeneralState>(
                    builder: (context, state) {
                      return TextField(
                        onTap: () => SearchOverlay.show(context),
                        readOnly: true,
                        controller:
                            TextEditingController(text: state.currentSearch),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
