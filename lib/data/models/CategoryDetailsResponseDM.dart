import 'package:grocery1/domain/entities/CategoryDetailsResponseEntity.dart';

/// success : true
/// message : "Category retrieved successfully"
/// data : {"id":2,"name":"Fruits","slug":"fruits","description":"Fresh seasonal fruits","image_url":"https://images.unsplash.com/photo-1619566636858-adf3ef46400b?w=400","sort_order":2,"meals":[{"id":3,"title":"Tropical Fruit Bowl","slug":"tropical-fruit-bowl","description":"Fresh tropical fruits including mango, pineapple, papaya, and dragon fruit. A taste of paradise!","image_url":"https://images.unsplash.com/photo-1559181567-c3190ca9959b?w=400","offer_title":"Fresh Today","price":18.99,"discount_price":14.99,"final_price":14.99,"rating":4.8,"rating_count":203,"has_offer":true,"is_featured":true,"features":"Fresh cut, No preservatives, High in vitamins"},{"id":4,"title":"Berry Medley","slug":"berry-medley","description":"A delicious mix of strawberries, blueberries, raspberries, and blackberries. Rich in antioxidants.","image_url":"https://images.unsplash.com/photo-1464965911861-746a04b4bca6?w=400","offer_title":null,"price":16.99,"discount_price":null,"final_price":16.99,"rating":4.6,"rating_count":145,"has_offer":false,"is_featured":false,"features":"Fresh, Antioxidant-rich, Premium quality"}],"created_at":"2026-01-12T19:55:52.000000Z","updated_at":"2026-01-12T19:55:52.000000Z"}

class CategoryDetailsResponseDm extends CategoryDetailsResponseEntity{
  CategoryDetailsResponseDm({
      super.success,
      super.message,
      super.data,});

  CategoryDetailsResponseDm.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? DataOfCategoryDetailsDm.fromJson(json['data']) : null;
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = (data as DataOfCategoryDetailsDm?)?.toJson();    }
    return map;
  }

}


class DataOfCategoryDetailsDm extends DataOfCategoryDetailsEntity {
  DataOfCategoryDetailsDm({
      super.id,
      super.name,
      super.slug,
      super.description,
      super.imageUrl,
      super.sortOrder,
      super.meals,
      super.createdAt,
      super.updatedAt,});

  DataOfCategoryDetailsDm.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    imageUrl = json['image_url'];
    sortOrder = json['sort_order'];
    if (json['meals'] != null) {
      meals = [];
      json['meals'].forEach((v) {
        meals?.add(CategoryDetailsMealsDm.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['description'] = description;
    map['image_url'] = imageUrl;
    map['sort_order'] = sortOrder;
    if (meals != null) {
      map['meals'] = meals
          ?.map((v) => (v as CategoryDetailsMealsDm).toJson())
          .toList();    }
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class CategoryDetailsMealsDm extends CategoryDetailsMealsEntity{
  CategoryDetailsMealsDm({
      super.id,
      super.title,
      super.slug,
      super.description,
      super.imageUrl,
      super.offerTitle,
      super.price,
      super.discountPrice,
      super.finalPrice,
      super.rating,
      super.ratingCount,
      super.hasOffer,
      super.isFeatured,
      super.features,});

  CategoryDetailsMealsDm.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    imageUrl = json['image_url'];
    offerTitle = json['offer_title'];
    price = json['price'];
    discountPrice = json['discount_price'];
    finalPrice = json['final_price'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
    hasOffer = json['has_offer'];
    isFeatured = json['is_featured'];
    features = json['features'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['description'] = description;
    map['image_url'] = imageUrl;
    map['offer_title'] = offerTitle;
    map['price'] = price;
    map['discount_price'] = discountPrice;
    map['final_price'] = finalPrice;
    map['rating'] = rating;
    map['rating_count'] = ratingCount;
    map['has_offer'] = hasOffer;
    map['is_featured'] = isFeatured;
    map['features'] = features;
    return map;
  }

}