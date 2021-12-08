part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class FetchProducts extends ProductEvent {
  final String category;
  final String search;
  FetchProducts({
    required this.category,
    required this.search,
  });
}
