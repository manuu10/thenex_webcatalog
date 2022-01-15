import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thenex_webcatalog/app_colors.dart';
import 'package:thenex_webcatalog/model/product/bloc/product_bloc.dart';
import 'package:thenex_webcatalog/state/general/general_bloc.dart';
import 'package:thenex_webcatalog/state/shopping_cart/shopping_cart_bloc.dart';
import 'package:thenex_webcatalog/view/pages/categories_page.dart';
import 'package:thenex_webcatalog/view/pages/products_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GeneralBloc>(
          create: (context) => GeneralBloc(),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(context.read<GeneralBloc>()),
        ),
        BlocProvider<ShoppingCartBloc>(
          create: (context) =>
              ShoppingCartBloc()..add(const LoadFromStorageEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // navigatorObservers: <RouteObserver<ModalRoute<void>>>[routeObserver],
        title: 'Thenex Webkatalog',
        // theme: ThemeData.dark(),
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.background,
            foregroundColor: AppColors.foreground,
            elevation: 0,
            shape: Border(
              bottom: BorderSide(
                width: 1,
                color: AppColors.foreground.withAlpha(200),
              ),
            ),
          ),
          cardColor: AppColors.secondBackground,
          scaffoldBackgroundColor: AppColors.background,
          primarySwatch: AppColors.colorToMatColor(AppColors.primary),
        ),
        routes: {
          // CategoriesPage.route: (ctx) => const CategoriesPage(),
          CategoriesPage.route: (ctx) => ProductsPage(),
        },
      ),
    );
  }
}
