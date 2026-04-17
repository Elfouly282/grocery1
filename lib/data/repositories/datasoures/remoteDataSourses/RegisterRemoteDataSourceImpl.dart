import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/data/models/RegisterResponseDM.dart';
import 'package:grocery1/domain/repositories/datasourses/remoteDataSourse/RegisterRemoteDataSource.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_endpoints.dart';
@Injectable(as:Registerremotedatasource)
class Registerremotedatasourceimpl implements Registerremotedatasource{
  ApiManger apiManger;
  Registerremotedatasourceimpl({required this.apiManger});
  @override
  Future<Either<Failure, RegisterResponseDm>> register(String name, String email, String password, String rePassword, String phone)async {
    var response=await  apiManger.postData(endPoint: ApiEndpoints.registerEndpoint,body: {
      "email":email,
      "username": name,
      "phone":phone,
      "password":password,
      "rePassword":rePassword,

    });
    try{
      final List<ConnectivityResult> connectivityResult=await Connectivity().checkConnectivity();
      if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)){
        var registerResponse=RegisterResponseDm.fromJson(response.data);//convert response to object
        if(response.statusCode!>=200&&response.statusCode!<300){
          return Right(registerResponse);
        }
        else{
          return Left(Failure(registerResponse.message!));
        }
      }
      else{
        // todo no internet connection
        return left(Failure( 'No Internet Connection ,Please Check Internet'));
      }
    }
    catch(e){
      return Left(Failure( e.toString()));
    }
  }


}