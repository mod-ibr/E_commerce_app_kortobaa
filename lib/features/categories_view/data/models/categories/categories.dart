import 'result.dart';

class Categories {
  int? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;

  Categories({this.count, this.next, this.previous, this.results});

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        count: json['count'] as int?,
        next: json['next'] as dynamic,
        previous: json['previous'] as dynamic,
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': results?.map((e) => e.toJson()).toList(),
      };
}
