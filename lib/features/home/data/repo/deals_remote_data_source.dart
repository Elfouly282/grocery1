
import '../model/deal_model.dart';


abstract class DealsRemoteDataSource {
  Future<List<DealModel>> getAllDeals();

  Future<DealModel> getDealById(int id);
}