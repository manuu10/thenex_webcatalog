part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {}

class ProductInitial extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded({
    required this.products,
  });

  @override
  List<Object?> get props => [products];
}

class ProductLoading extends ProductState {
  @override
  List<Object?> get props => [];
}
