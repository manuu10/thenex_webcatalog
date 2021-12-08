import 'dart:convert';

class Category {
  final String name;
  final int count;
  const Category({
    required this.name,
    required this.count,
  });

  static const Category constructEmpty = Category(name: "", count: 0);

  String getNameWithoutNumber() {
    if (name.length > 4) {
      return name.substring(4);
    }
    return name;
  }

  Category copyWith({
    String? name,
    int? count,
  }) {
    return Category(
      name: name ?? this.name,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'count': count,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'],
      count: map['count'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() => 'Category(name: $name, count: $count)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category && other.name == name && other.count == count;
  }

  @override
  int get hashCode => name.hashCode ^ count.hashCode;
}
