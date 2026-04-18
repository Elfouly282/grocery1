import 'package:flutter/material.dart';
import 'package:grocery1/feature/product_details/domain/entity/product_details_entity.dart';

@immutable
abstract class ProductDetailsState {}

class ProductDetailsInitialState extends ProductDetailsState {}

class ProductDetailsLoadingState extends ProductDetailsState {}

class ProductDetailsSuccessState extends ProductDetailsState {
  final ProductDetailsResponseEntity productDetailsResponseEntity;
  ProductDetailsSuccessState({required this.productDetailsResponseEntity});
}

class ProductDetailsErrorState extends ProductDetailsState {
  final String errorMessage;
  ProductDetailsErrorState({required this.errorMessage});
}
