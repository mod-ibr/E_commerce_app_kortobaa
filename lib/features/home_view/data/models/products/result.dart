import 'category.dart';

class Result {
  int? id;
  String? name;
  String? imageLink;
  String? price;
  String? description;
  String? rate;
  Category? category;
  int? isAddedToFavorite;
  int? isAddedToCart;
  int? amount;

  Result(
      {this.id,
      this.name,
      this.imageLink,
      this.price,
      this.description,
      this.rate,
      this.category,
      this.isAddedToFavorite,
      this.isAddedToCart,
      this.amount});

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
        isAddedToCart:
            json['isAddedToCart'] == null ? 0 : json['isAddedToCart'] as int?,
        isAddedToFavorite: json['isAddedToFavorite'] == null
            ? 0
            : json['isAddedToFavorite'] as int?,
        amount: json['amount'] == null ? 1 : json['amount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image_link': imageLink,
        'price': price,
        'description': description,
        'rate': rate,
        'amount': amount ?? 1,
        'isAddedToCart': isAddedToCart ?? 0,
        'isAddedToFavorite': isAddedToFavorite ?? 0,
        'category': category?.toJson(),
      };
}
