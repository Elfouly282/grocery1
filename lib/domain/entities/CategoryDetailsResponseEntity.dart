/// success : true
/// message : "Category retrieved successfully"
/// data : {"id":2,"name":"Fruits","slug":"fruits","description":"Fresh seasonal fruits","image_url":"https://images.unsplash.com/photo-1619566636858-adf3ef46400b?w=400","sort_order":2,"meals":[{"id":3,"title":"Tropical Fruit Bowl","slug":"tropical-fruit-bowl","description":"Fresh tropical fruits including mango, pineapple, papaya, and dragon fruit. A taste of paradise!","image_url":"https://images.unsplash.com/photo-1559181567-c3190ca9959b?w=400","offer_title":"Fresh Today","price":18.99,"discount_price":14.99,"final_price":14.99,"rating":4.8,"rating_count":203,"has_offer":true,"is_featured":true,"features":"Fresh cut, No preservatives, High in vitamins"},{"id":4,"title":"Berry Medley","slug":"berry-medley","description":"A delicious mix of strawberries, blueberries, raspberries, and blackberries. Rich in antioxidants.","image_url":"https://images.unsplash.com/photo-1464965911861-746a04b4bca6?w=400","offer_title":null,"price":16.99,"discount_price":null,"final_price":16.99,"rating":4.6,"rating_count":145,"has_offer":false,"is_featured":false,"features":"Fresh, Antioxidant-rich, Premium quality"}],"created_at":"2026-01-12T19:55:52.000000Z","updated_at":"2026-01-12T19:55:52.000000Z"}

class CategoryDetailsResponseEntity {
  CategoryDetailsResponseEntity({
      this.success, 
      this.message, 
      this.data,});
  bool? success;
  String? message;
  DataOfCategoryDetailsEntity? data;

}
class DataOfCategoryDetailsEntity {
  DataOfCategoryDetailsEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.description, 
      this.imageUrl, 
      this.sortOrder, 
      this.meals, 
      this.createdAt, 
      this.updatedAt,});

  num? id;
  String? name;
  String? slug;
  String? description;
  String? imageUrl;
  num? sortOrder;
  List<CategoryDetailsMealsEntity>? meals;
  String? createdAt;
  String? updatedAt;
}

class CategoryDetailsMealsEntity {
  CategoryDetailsMealsEntity({
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.imageUrl, 
      this.offerTitle, 
      this.price, 
      this.discountPrice, 
      this.finalPrice, 
      this.rating, 
      this.ratingCount, 
      this.hasOffer, 
      this.isFeatured, 
      this.features,});

  num? id;
  String? title;
  String? slug;
  String? description;
  String? imageUrl;
  String? offerTitle;
  num? price;
  num? discountPrice;
  num? finalPrice;
  num? rating;
  num? ratingCount;
  bool? hasOffer;
  bool? isFeatured;
  String? features;

}