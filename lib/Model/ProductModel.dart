import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Product extends Equatable {
  final String name;
  final int price;
  final String image;
  final String description;
  Product({
    @required this.name,
    @required this.price,
    @required this.image,
    @required this.description,
  });

  @override
  List<Object> get props => [
        name,
        price,
        image,
        description,
      ];

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json["name"],
      price: json["price"],
      image: json["image"],
      description: json["description"],
    );
  }
}
