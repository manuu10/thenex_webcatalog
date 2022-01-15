import 'package:http/http.dart' as http;
import 'package:thenex_webcatalog/model/my_request/my_request.dart';
import 'package:thenex_webcatalog/model/product/bloc/product_bloc.dart';
import 'package:thenex_webcatalog/model/product/product.dart';
import 'package:thenex_webcatalog/service/http_service.dart';

class ProductRepo extends HttpService {
  Future<List<Product>> fetchProducts(FetchProducts event) async =>
      await requestDataList<Product>(
        "/products?category=${event.category}&search=${event.search}",
      );
  Future<List<Product>> fetchProductsById(List<String> ids) async {
    var result = await requestDataList<Product>(
      "/productsById?ids=$ids",
    );
    List<Product> duplicateList = [];
    for (var id in ids) {
      var prod = result.where((element) => element.artikelnummer == id);
      if (prod.isEmpty) continue;
      duplicateList.add(prod.first);
    }
    return duplicateList;
  }

  Future<void> sendRequest(MyRequest request) async {
    final productids =
        request.product.map<String>((e) => e.artikelnummer).toList();
    final String data =
        "?company=${request.company}&firstname=${request.firstname}&lastname=${request.lastname}&email=${request.email}&telephone=${request.telephone}&additional=${request.additional}&productids=$productids";
    final uri = Uri.parse(HttpService.api + "/request" + data);
    await http.get(uri, headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
  }
}
