// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'subcategories_cubit.dart';

// -------------------------              Design state contain all information 
class Subcategories {
  final List<SubcategoriesEntity> subcategories;
  final List<MealEntity> products;
  final bool categoriesLoading;
  final bool productsLoading;

  final String? error;
  final int? selectedCategoryId;
  Subcategories({
    this.categoriesLoading=false,
    this.subcategories = const [],
    this.products = const [],
    this.productsLoading = false,
    this.error,
    this.selectedCategoryId ,
  });

  Subcategories copyWith({
    List<SubcategoriesEntity>? subcategories,
    List<MealEntity>? products,
   final bool? categoriesLoading,
  final bool? productsLoading,
    String? error,
    int? selectedCategoryId,
  }) {
    return Subcategories(
      subcategories: subcategories ?? this.subcategories,
      products: products ?? this.products,
      productsLoading: productsLoading ?? this.productsLoading,
      categoriesLoading: categoriesLoading ?? this.categoriesLoading ,
      error: error ,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
    );
  }
}

