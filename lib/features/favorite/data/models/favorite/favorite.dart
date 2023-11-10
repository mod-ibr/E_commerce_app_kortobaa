
class Favorite {
  int? id;
  String? name;
  String? imageLink;
  String? price;
  String? description;
  String? rate;

  Favorite({
    this.id,
    this.name,
    this.imageLink,
    this.price,
    this.description,
    this.rate,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        id: json['id'] as int?,
        name: json['name'] as String?,
        imageLink: json['image_link'] as String?,
        price: json['price'] as String?,
        description: json['description'] as String?,
        rate: json['rate'] as String?,
       
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image_link': imageLink,
        'price': price,
        'description': description,
        'rate': rate,
      };
}
