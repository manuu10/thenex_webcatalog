import 'package:flutter/material.dart';

class RequestForm extends StatelessWidget {
  const RequestForm({Key? key, required this.formKey}) : super(key: key);
  String? notEmptyValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              validator: notEmptyValidator,
              decoration: const InputDecoration(
                  labelText: "Company", hintText: "Company"),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    validator: notEmptyValidator,
                    decoration: const InputDecoration(
                        labelText: "Lastname", hintText: "Lastname"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    validator: notEmptyValidator,
                    decoration: const InputDecoration(
                        labelText: "Firstname", hintText: "Firstname"),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    validator: notEmptyValidator,
                    decoration: const InputDecoration(
                        labelText: "E-Mail", hintText: "E-Mail"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    validator: notEmptyValidator,
                    decoration: const InputDecoration(
                        labelText: "Tel.", hintText: "Tel."),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  helperText: "Custom additional infomation",
                  hintText: "Enter some custom additional information here..."),
              minLines: 5,
              maxLines: 10,
            )
          ],
        ));
  }
}
