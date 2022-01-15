import 'package:flutter/material.dart';
import 'package:thenex_webcatalog/model/my_request/my_request.dart';
import 'package:thenex_webcatalog/model/product/product.dart';
import 'package:thenex_webcatalog/model/product/product_repo.dart';
import 'package:thenex_webcatalog/view/widgets/request_form.dart';

import '../../app_colors.dart';

class SendRequestDialog extends StatefulWidget {
  const SendRequestDialog({Key? key, required this.product}) : super(key: key);
  final Product product;

  static Future<void> show(BuildContext context, Product product) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SendRequestDialog(product: product),
      ),
    );
  }

  @override
  _SendRequestDialogState createState() => _SendRequestDialogState();
}

class _SendRequestDialogState extends State<SendRequestDialog> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController compController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final TextEditingController additionalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 400,
      ),
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.product.bezeichnung,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 2, color: AppColors.primary),
            SelectableText(
              widget.product.beschreibung,
              style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withAlpha(200),
                  fontSize: 24),
            ),
            const Divider(thickness: 2, color: AppColors.primary),
            RequestForm(
              formKey: _formKey,
              compController: compController,
              additionalController: additionalController,
              emailController: emailController,
              fNameController: fNameController,
              lNameController: lNameController,
              telController: telController,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                MyRequest myRequest = MyRequest(
                  product: [widget.product],
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
        ),
      ),
    );
  }
}
