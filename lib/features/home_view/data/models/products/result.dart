import 'category.dart';

class Result {
  int? id;
  String? name;
  String? imageLink;
  String? price;
  String? description;
  String? rate;
  Category? category;
  bool? isAddedToFavorite;
  bool? isAddedToCart;

  Result(
      {this.id,
      this.name,
      this.imageLink,
      this.price,
      this.description,
      this.rate,
      this.category,
      this.isAddedToFavorite,
      this.isAddedToCart});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['id'] as int?,
        name: json['name'] as String?,
        imageLink: json['image_link'] as String?,
        price: json['price'] as String?,
        description: json['description'] as String?,
        rate: json['rate'] as String?,
        category: json['category'] == null
            ? null
            : Category.fromJson(json['category'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image_link': imageLink,
        'price': price,
        'description': description,
        'rate': rate,
        'category': category?.toJson(),
      };
}
