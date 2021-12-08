import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:thenex_webcatalog/model/category/category.dart';
import 'package:thenex_webcatalog/model/product/product.dart';
import 'package:thenex_webcatalog/model/product/product_repo.dart';
import 'package:thenex_webcatalog/state/general/general_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final repo = ProductRepo();
  final GeneralBloc _generalBloc;
  ProductBloc(
    this._generalBloc,
  ) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {});
    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());
      final res = await repo.fetchProducts(event);
      emit(ProductLoaded(products: res));
      _generalBloc.add(GeneralSetCategory(
          category: Category(count: res.length, name: event.category)));
      _generalBloc.add(GeneralSetSearch(search: event.search));
    });
  }
}
