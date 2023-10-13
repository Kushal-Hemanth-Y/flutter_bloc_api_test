part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();
  
  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

final class ProductsLoadingState extends ProductsState {
  //indicator
}

final class ProductsLoadedState extends ProductsState {
  final List<ProductsModel> productsModel;

  const ProductsLoadedState({required this.productsModel});

    @override
  List<Object> get props => [];
}

final class ProductsErrorState extends ProductsState {
  final String errorMessage;

  const ProductsErrorState( { required this.errorMessage});
    @override
  List<Object> get props => [errorMessage];
}
