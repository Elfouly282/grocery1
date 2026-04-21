import 'package:grocery1/features/productslist/data/models/sub_category_details/meal_model.dart';
import 'package:grocery1/features/productslist/data/models/subcategory_model.dart';
import 'package:grocery1/features/productslist/domain/entities/meal_entity.dart';
import 'package:grocery1/features/productslist/domain/entities/subcategories_entity.dart';

extension ToSubcategoryEntity on SubcategoryModel {
  SubcategoriesEntity toEntity() => SubcategoriesEntity(
    id: id,
    name: name ?? '',
    imageUrl: imageUrl ?? '',
    mealsCount: mealsCount ?? 0,
    categoryName: category?.name ?? '',
  );
}

extension ToMealEntity on MealModel {
  MealEntity toEntity() => MealEntity(
    id: id,
    title: title,
    imageurl: imageUrl ?? "",
    price: price ?? 0,
    discountprice: discountPrice ?? 0,
    finalprice: finalPrice ?? 0,
    rating: rating ?? 0.0,
    isfeatured: isFeatured ?? false,
  );
}
