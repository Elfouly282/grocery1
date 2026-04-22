import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entity/deal_entity.dart';
import '../repo/deals_repository.dart';

class GetAllDealsUseCase {
  final DealsRepository dealsRepository;

  GetAllDealsUseCase(this.dealsRepository);

  Future<Either<Failure, List<DealEntity>>> call() {
    return dealsRepository.getAllDeals();
  }
}