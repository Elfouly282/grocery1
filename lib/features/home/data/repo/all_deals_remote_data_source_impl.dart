import 'package:grocery1/core/api/api_endpoints.dart';
import 'package:grocery1/core/api/api_manager.dart';

import '../model/deal_model.dart';
import 'deals_remote_data_source.dart';


class AllDealsRemoteDataSourceImpl implements DealsRemoteDataSource {
  final ApiManager apiManager;

  AllDealsRemoteDataSourceImpl(this.apiManager);
  @override
  Future<List<DealModel>> getAllDeals()async {
  try{
    final response=await apiManager.postData(
        endPoint: ApiEndpoints.mealsEndpoint);
    if(response.statusCode==200||response.statusCode==201){
      final responseData=response.data;
      final List models = responseData;

      final deals = models.map((item) {
        return DealModel.fromJson(item);
      }).toList();
      return deals;
    }
    throw Exception("Failed to load deals");
  }catch(e){
    throw Exception("Failed to load deals");
  }
  }

  @override
  Future<DealModel> getDealById(int id) {
    // TODO: implement getDealById
    throw UnimplementedError();
  }


}