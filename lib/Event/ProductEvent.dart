import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class GetProduct extends ProductEvent {
  const GetProduct();

  @override
  List<Object> get props => [];
}
