import 'package:thenex_webcatalog/model/category/category.dart';
import 'package:thenex_webcatalog/service/http_service.dart';

class CategoryRepo extends HttpService {
  Future<List<Category>> fetchCategory() async =>
      await requestDataList<Category>("/categories");

  Future<List<Category>> fetchCategorySearch(String search) async =>
      await requestDataList<Category>("/categories/$search");
}
