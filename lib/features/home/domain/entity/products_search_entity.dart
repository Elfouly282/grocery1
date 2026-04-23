class ProductSearchEntity {
  final List<Product> products;
  final int totalCount;
  final ProductFilters filtersApplied;
  final String? emptyMessage;

  ProductSearchEntity({
    required this.products,
    required this.totalCount,
    required this.filtersApplied,
    this.emptyMessage,
  });
}

class Product {
  final int id;
  final String name;
  final double price;
  final double rating;
  final String brand;
  final int categoryId;
  final int subcategoryId;
  final bool isFeatured;
  final bool inStock;
  final String createdAt;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.rating,
    required this.brand,
    required this.categoryId,
    required this.subcategoryId,
    required this.isFeatured,
    required this.inStock,
    required this.createdAt,
  });
}

class ProductFilters {
  final String? search;
  final int? categoryId;
  final int? subcategoryId;
  final double? minPrice;
  final double? maxPrice;
  final double? minRating;
  final String? brand;
  final bool? featured;
  final bool? inStock;
  final String? sortBy;
  final String? sortOrder;

  ProductFilters({
    this.search,
    this.categoryId,
    this.subcategoryId,
    this.minPrice,
    this.maxPrice,
    this.minRating,
    this.brand,
    this.featured,
    this.inStock,
    this.sortBy,
    this.sortOrder,
  });
}