import 'package:grocery1/features/productslist/data/models/sub_category_details/subcategorydetails_response.dart';
import 'package:grocery1/features/productslist/data/models/subcategory_response.dart';

abstract class SubcategoryDatasource {
  Future<SubcategoryResponse> getSubcategories();
  Future<SubCategoryDetailsResponse> getSubcategoryDetails(int id);
}
