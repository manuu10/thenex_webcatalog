import 'package:flutter/material.dart';
import 'package:thenex_webcatalog/app_colors.dart';
import 'package:thenex_webcatalog/model/product/product.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile(this.product, {Key? key, this.count = 0})
      : super(key: key);
  final Product product;
  final int count;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        product.bezeichnung,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Text(
          product.beschreibung,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.foreground.withAlpha(128),
          ),
        )
      ],
      trailing: Text(count.toString()),
      expandedAlignment: Alignment.topLeft,
    );
  }
}
