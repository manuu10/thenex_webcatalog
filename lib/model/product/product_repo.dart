import 'package:thenex_webcatalog/model/product/bloc/product_bloc.dart';
import 'package:thenex_webcatalog/model/product/product.dart';
import 'package:thenex_webcatalog/service/http_service.dart';

class ProductRepo extends HttpService {
  Future<List<Product>> fetchProducts(FetchProducts event) async =>
      await requestDataList<Product>(
        "/products?category=${event.category}&search=${event.search}",
      );
}
