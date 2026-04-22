import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entity/category_entity.dart';
import '../entity/deal_entity.dart';

abstract class DealsRepository {
  Future<Either<Failure, List<DealEntity>>> getAllDeals();
  Future<Either<Failure, DealEntity>> getDealById(int id);
}