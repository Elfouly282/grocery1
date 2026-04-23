import '../../domain/entity/products_search_entity.dart';

class ProductSearchModel extends ProductSearchEntity {
  ProductSearchModel({
    required List<ProductModel> products,
    required int totalCount,
    required ProductFiltersModel filtersApplied,
    String? emptyMessage,
  }) : super(
    products: products,
    totalCount: totalCount,
    filtersApplied: filtersApplied,
    emptyMessage: emptyMessage,
  );

  factory ProductSearchModel.fromJson(Map<String, dynamic> json) {
    return ProductSearchModel(
      products: (json['data'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList(),
      totalCount: json['total_count'],
      filtersApplied: ProductFiltersModel.fromJson(json['filters_applied']),
      emptyMessage: json['empty_message'],
    );
  }
}

class ProductModel extends Product {
  ProductModel({
    required int id,
    required String name,
    required double price,
    required double rating,
    required String brand,
    required int categoryId,
    required int subcategoryId,
    required bool isFeatured,
    required bool inStock,
    required String createdAt,
  }) : super(
    id: id,
    name: name,
    price: price,
    rating: rating,
    brand: brand,
    categoryId: categoryId,
    subcategoryId: subcategoryId,
    isFeatured: isFeatured,
    inStock: inStock,
    createdAt: createdAt,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      rating: (json['rating'] ?? 0).toDouble(),
      brand: json['brand'] ?? '',
      categoryId: json['category_id'] ?? 0,
      subcategoryId: json['subcategory_id'] ?? 0,
      isFeatured: json['is_featured'] ?? false,
      inStock: json['in_stock'] ?? false,
      createdAt: json['created_at'] ?? '',
    );
  }
}

class ProductFiltersModel extends ProductFilters {
  ProductFiltersModel({
    String? search,
    int? categoryId,
    int? subcategoryId,
    double? minPrice,
    double? maxPrice,
    double? minRating,
    String? brand,
    bool? featured,
    bool? inStock,
    String? sortBy,
    String? sortOrder,
  }) : super(
    search: search,
    categoryId: categoryId,
    subcategoryId: subcategoryId,
    minPrice: minPrice,
    maxPrice: maxPrice,
    minRating: minRating,
    brand: brand,
    featured: featured,
    inStock: inStock,
    sortBy: sortBy,
    sortOrder: sortOrder,
  );

  factory ProductFiltersModel.fromJson(Map<String, dynamic> json) {
    return ProductFiltersModel(
      search: json['search'],
      categoryId: int.tryParse(json['category_id'].toString()),
      subcategoryId: int.tryParse(json['subcategory_id'].toString()),
      minPrice: double.tryParse(json['min_price'].toString()),
      maxPrice: double.tryParse(json['max_price'].toString()),
      minRating: double.tryParse(json['min_rating'].toString()),
      brand: json['brand'],
      featured: json['featured'],
      inStock: json['in_stock'],
      sortBy: json['sort_by'],
      sortOrder: json['sort_order'],
    );
  }
}