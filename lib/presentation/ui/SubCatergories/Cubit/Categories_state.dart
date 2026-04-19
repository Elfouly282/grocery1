
import 'package:grocery1/domain/entities/CategoriesResponseEntity.dart';

abstract class CategoryState {
}

/// Initial
class CategoryInitial extends CategoryState {}

/// Loading
class CategoryLoading extends CategoryState {}

/// Success
class CategorySuccess extends CategoryState {
  final CategoriesResponseEntity response;

   CategorySuccess(this.response);
  List<Object?> get props => [response];
}

/// Error
class CategoryError extends CategoryState {
  final String message;
   CategoryError(this.message);
  List<Object?> get props => [message];
}