import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Event/ProductEvent.dart';
import 'package:untitled/Repository/ProductRepository.dart';
import 'package:untitled/State/ProductState.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;
  ProductBloc(this.repository) : super(null);

  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    try {
      if (event is GetProduct) {
        final product = await repository.retriveProduct();
        yield ProductLoaded(product);
      }
    } catch (error) {
      print("Error: " + error.toString());
    }
  }
}
