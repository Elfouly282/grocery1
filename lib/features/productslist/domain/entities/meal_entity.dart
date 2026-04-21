
class MealEntity {
  final int id;
  final String title;
  final String? imageurl;
  final double price;
  final double discountprice;
  final double finalprice;
  final double rating;
  final bool isfeatured;
  MealEntity({
    required this.id,
    required this.title,
     this.imageurl,
    required this.price,
    required this.discountprice,
    required this.finalprice,
    required this.rating,
    required this.isfeatured,
  });
}
