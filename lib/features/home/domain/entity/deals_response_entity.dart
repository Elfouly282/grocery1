import 'deal_entity.dart';

class DealsResponseEntity {
  final bool success;
  final String message;
  final List<DealEntity> deals;

  const DealsResponseEntity({
    required this.success,
    required this.message,
    required this.deals,
  });
}