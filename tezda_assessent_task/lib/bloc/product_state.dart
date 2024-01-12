part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoadSuccess extends ProductState {
  final List<Product> products;

  const ProductLoadSuccess(this.products);

  @override
  List<Object> get props => [products];
}

class ProductLoadFailure extends ProductState {
  final String error;

  const ProductLoadFailure(this.error);

  @override
  List<Object> get props => [error];
}

class ProductIsFavorite extends ProductState {
  final bool isFavorite;

  const ProductIsFavorite(this.isFavorite);

  @override
  List<Object> get props => [isFavorite];
}
