import 'package:bloc/bloc.dart';
import 'package:bloc_pattern_cs_test/models/products_model.dart';
import 'package:bloc_pattern_cs_test/repo/products_repo.dart';
import 'package:equatable/equatable.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsLoadedEvent, ProductsState> {
  final ProductsRepo productsRepo;
  ProductsBloc(this.productsRepo) : super(ProductsLoadingState()) {
    on<ProductsLoadedEvent>((event, emit) async {
      try{
        emit(ProductsLoadingState());
       var data = await productsRepo.getProducts();
        emit( ProductsLoadedState(productsModel: data));
      }
      catch(e) {
        emit(ProductsErrorState( errorMessage: e.toString()));
      }
    });
  }
}
