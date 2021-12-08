import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thenex_webcatalog/model/category/category.dart';
import 'package:thenex_webcatalog/model/category/category_repo.dart';
import 'package:thenex_webcatalog/model/product/bloc/product_bloc.dart';
import 'package:thenex_webcatalog/view/widgets/category_list_tile.dart';
import 'package:thenex_webcatalog/view/widgets/custom_future_builder.dart';

class SearchOverlay extends StatefulWidget {
  const SearchOverlay({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const SearchOverlay(),
    );
  }

  @override
  _SearchOverlayState createState() => _SearchOverlayState();
}

class _SearchOverlayState extends State<SearchOverlay> {
  Future<List<Category>> _ftCategory = Future.value(<Category>[]);

  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  onSearchTextChange(String text) {
    if (text.length > 5) {
      setState(() {
        _ftCategory = CategoryRepo().fetchCategorySearch(text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: TextField(
        autofocus: true,
        controller: _controller,
        onChanged: onSearchTextChange,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
        ),
      ),
      content: SizedBox(
        width: 400,
        child: CustomFutureBuilder<List<Category>>(
          future: _ftCategory,
          onLoading: (context) => const LinearProgressIndicator(),
          onData: (context, data) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return CategoryListTile(
                    data[index],
                    onTap: () {
                      context.read<ProductBloc>().add(FetchProducts(
                          category: data[index].name,
                          search: _controller.text));
                      Navigator.of(context).pop();
                    },
                  );
                });
          },
        ),
      ),
    );
  }
}
