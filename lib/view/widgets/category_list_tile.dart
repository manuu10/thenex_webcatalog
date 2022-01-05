import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thenex_webcatalog/app_colors.dart';
import 'package:thenex_webcatalog/model/category/category.dart';
import 'package:thenex_webcatalog/model/product/bloc/product_bloc.dart';

class CategoryListTile extends StatelessWidget {
  const CategoryListTile(this.category,
      {Key? key, this.onTap, this.isSelected = false})
      : super(key: key);
  final Category category;
  final VoidCallback? onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: isSelected ? Border.all(width: 2, color: AppColors.primary) : null,
      onTap: () {
        if (onTap != null) {
          onTap!();
          return;
        }
        context
            .read<ProductBloc>()
            .add(FetchProducts(category: category.name, search: ""));
      },
      title: Text(
        category.getNameWithoutNumber(),
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: Card(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            category.count.toString(),
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
