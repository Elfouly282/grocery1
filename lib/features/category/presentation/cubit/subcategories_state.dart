part of 'subcategories_cubit.dart';

abstract class SubcategoriesState {
  const SubcategoriesState();
}

final class SubcategoriesInitial extends SubcategoriesState {
  const SubcategoriesInitial();
}

final class SubcategoriesLoading extends SubcategoriesState {
  const SubcategoriesLoading();
}

final class SubcategoriesError extends SubcategoriesState {
  final String message;
  const SubcategoriesError(this.message);
}

class SubcategoriesLoaded extends SubcategoriesState {
  final List<SubcategoriesEntity> subcategories;
  const SubcategoriesLoaded(this.subcategories);
}

final class SubcategoriesDetailsLoading extends SubcategoriesState {
  const SubcategoriesDetailsLoading();
}

final class SubcategoriesDetailsError extends SubcategoriesState {
  final String message;
  const SubcategoriesDetailsError(this.message);
}

final class SubcategoriesDetailsLoaded extends SubcategoriesState {
  final List<MealEntity> subcategorydetailslist;
  const SubcategoriesDetailsLoaded(this.subcategorydetailslist);
}
