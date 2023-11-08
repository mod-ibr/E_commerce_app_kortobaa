class Category {
  int? id;
  String? name;
  String? imageLink;

  Category({this.id, this.name, this.imageLink});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int?,
        name: json['name'] as String?,
        imageLink: json['image_link'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image_link': imageLink,
      };
}
