import 'package:thenex_webcatalog/model/product/product.dart';

class MyRequest {
  final List<Product> product;
  final String company;
  final String lastname;
  final String firstname;
  final String email;
  final String telephone;
  final String additional;
  MyRequest({
    required this.product,
    required this.company,
    required this.lastname,
    required this.firstname,
    required this.email,
    required this.telephone,
    required this.additional,
  });
}
