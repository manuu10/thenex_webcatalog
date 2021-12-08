import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thenex_webcatalog/model/category/category.dart';
import 'package:thenex_webcatalog/model/category/category_repo.dart';
import 'package:thenex_webcatalog/model/product/bloc/product_bloc.dart';
import 'package:thenex_webcatalog/view/pages/products_page.dart';
import 'package:thenex_webcatalog/view/widgets/custom_future_builder.dart';

class CategoriesPage extends StatelessWidget {
  static const route = "/";
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('categories page'),
      ),
      body: CustomFutureBuilder<List<Category>>(
        future: CategoryRepo().fetchCategory(),
        onData: (context, data) {
          return GridView.builder(
            // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //   crossAxisCount: 10,
            // ),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: data!.length,
            itemBuilder: (ctx, index) {
              final item = data[index];
              return OutlinedButton(
                onPressed: () {
                  context
                      .read<ProductBloc>()
                      .add(FetchProducts(category: item.name, search: ""));
                  Navigator.pushNamed(context, ProductsPage.route);
                },
                child: Text("(${item.count})" + item.name),
              );
            },
          );
        },
      ),
    );
  }
}
