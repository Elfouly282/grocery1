import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';

import '../entity/deal_entity.dart';
import '../repo/deals_repository.dart';


class GetDealByIdUseCase {
  final DealsRepository dealsRepository;

  GetDealByIdUseCase(this.dealsRepository);

  Future<Either<Failure, DealEntity>> call({
    required int id,
  }) {
    return dealsRepository.getDealById(id);
  }
}