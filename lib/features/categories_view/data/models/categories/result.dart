class Result {
  int? id;
  String? name;
  String? imageLink;

  Result({this.id, this.name, this.imageLink});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
