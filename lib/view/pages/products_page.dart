import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thenex_webcatalog/app_colors.dart';
import 'package:thenex_webcatalog/model/category/category.dart';
import 'package:thenex_webcatalog/model/category/category_repo.dart';
import 'package:thenex_webcatalog/model/product/bloc/product_bloc.dart';
import 'package:thenex_webcatalog/state/general/general_bloc.dart';
import 'package:thenex_webcatalog/state/shopping_cart/shopping_cart_bloc.dart';
import 'package:thenex_webcatalog/view/widgets/category_list_tile.dart';
import 'package:thenex_webcatalog/view/widgets/custom_future_builder.dart';
import 'package:thenex_webcatalog/view/widgets/search_overlay.dart';
import 'package:thenex_webcatalog/view/widgets/send_request_dialog.dart';

class ProductsPage extends StatelessWidget {
  static const route = "/products";
  ProductsPage({Key? key}) : super(key: key);

  final catController = ScrollController();
  final prdController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Thenex Webcatalog',
                style: Theme.of(context).textTheme.headline4,
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
              const SizedBox(),
            ],
          ),
          actions: [
            BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
              builder: (context, state) {
                return TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_bag),
                    label: Text(state.shoppingList.length.toString()));
              },
            ),
          ],
        ),
        body: Row(
          children: [
            SizedBox(
              width: 300,
              child: CustomFutureBuilder<List<Category>>(
                future: CategoryRepo().fetchCategory(),
                onData: (context, data) {
                  return ListView.builder(
                    controller: catController,
                    itemCount: data!.length,
                    itemBuilder: (ctx, index) {
                      final item = data[index];
                      return BlocBuilder<GeneralBloc, GeneralState>(
                        builder: (context, state) {
                          return CategoryListTile(
                            item,
                            isSelected:
                                state.currentlySelected.name == item.name,
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductInitial) {
                    return Center(
                      child: Text(
                        "Choose a category to view the articles",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    );
                  }
                  if (state is! ProductLoaded) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state.products.isEmpty) {
                    return Center(
                        child: Text(
                      "No articles",
                      style: Theme.of(context).textTheme.headline3,
                    ));
                  }
                  return GridView.builder(
                    padding: const EdgeInsets.all(8),
                    controller: prdController,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 400,
                            mainAxisExtent: 250,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final item = state.products[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectableText(
                                item.bezeichnung,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const Divider(
                                  thickness: 2, color: AppColors.primary),
                              Expanded(
                                child: SelectableText(
                                  item.beschreibung,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color!
                                          .withAlpha(200),
                                      fontSize: 24),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        SendRequestDialog.show(context, item);
                                      },
                                      label: const Text("Request"),
                                      icon: const Icon(Icons.send),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: () {
                                        final bloc =
                                            context.read<ShoppingCartBloc>();
                                        bloc.add(AddToShoppingCartEvent(item));
                                      },
                                      child: const Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ));
  }
}
