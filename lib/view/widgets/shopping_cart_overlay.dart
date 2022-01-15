import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thenex_webcatalog/model/my_request/my_request.dart';
import 'package:thenex_webcatalog/model/product/product_repo.dart';
import 'package:thenex_webcatalog/state/shopping_cart/shopping_cart_bloc.dart';
import 'package:thenex_webcatalog/view/widgets/product_list_tile.dart';
import 'package:thenex_webcatalog/view/widgets/request_form.dart';

class ShoppingOverlay extends StatefulWidget {
  const ShoppingOverlay({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const ShoppingOverlay(),
    );
  }

  @override
  _ShoppingOverlayState createState() => _ShoppingOverlayState();
}

class _ShoppingOverlayState extends State<ShoppingOverlay> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController compController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final TextEditingController additionalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Shopping Cart"),
      content: SizedBox(
        width: 500,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
                builder: (context, state) {
                  return Column(
                    children: state
                        .productCount()
                        .entries
                        .map<Widget>((e) => ProductListTile(
                              e.key,
                              count: e.value,
                            ))
                        .toList(),
                  );
                },
              ),
              RequestForm(
                  compController: compController,
                  lNameController: lNameController,
                  fNameController: fNameController,
                  emailController: emailController,
                  telController: telController,
                  additionalController: additionalController,
                  formKey: _formKey)
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton.icon(
          onPressed: () {
            if (!_formKey.currentState!.validate()) {
              return;
            }
            MyRequest myRequest = MyRequest(
              product: context.read<ShoppingCartBloc>().state.shoppingList,
              company: compController.text,
              lastname: lNameController.text,
              firstname: fNameController.text,
              email: emailController.text,
              telephone: telController.text,
              additional: additionalController.text,
            );
            ProductRepo().sendRequest(myRequest);
          },
          label: const Text("Request"),
          icon: const Icon(Icons.send),
        ),
      ],
    );
  }
}
