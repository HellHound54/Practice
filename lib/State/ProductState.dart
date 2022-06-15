import 'package:equatable/equatable.dart';
import 'package:untitled/Model/ProductModel.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductLoaded extends ProductState {
  final List<Product> product;
  const ProductLoaded(this.product);

  @override
  List<Object> get props => [product];
}
