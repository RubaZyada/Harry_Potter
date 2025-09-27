/*class BookModel {
  final int number;
  final String title;
  final String originalTitle;
  final String releaseDate;
  final String description;
  final int pages;
  final String cover;
  final int index;

  BookModel({
    required this.number,
    required this.title,
    required this.originalTitle,
    required this.releaseDate,
    required this.description,
    required this.pages,
    required this.cover,
    required this.index,
  });

  factory BookModel.fromJson(Map<dynamic, dynamic> json) {
    return BookModel(
      number: json['number'],
      title: json['title'],
      originalTitle: json['originalTitle'],
      releaseDate: json['releaseDate'],
      description: json['description'],
      pages: json['pages'],
      cover: json['cover'],
      index: json['index'],
    );
  }
}*/
class BookModel {
  final int number;
  final String title;
  final String originalTitle;
  final String releaseDate;
  final String description;
  final int pages;
  final String cover;
  final int index;

  BookModel({
    required this.number,
    required this.title,
    required this.originalTitle,
    required this.releaseDate,
    required this.description,
    required this.pages,
    required this.cover,
    required this.index,
  });

 factory BookModel.fromJson(Map<String, dynamic> json) {
  int _toInt(dynamic v) => (v is num) ? v.toInt() : int.tryParse('$v') ?? 0;

  return BookModel(
    number: _toInt(json['number']),
    title: (json['title'] ?? '').toString(),
    originalTitle: (json['originalTitle'] ?? '').toString(),
    releaseDate: (json['releaseDate'] ?? '').toString(),
    description: (json['description'] ?? '').toString(),
    pages: _toInt(json['pages']),
    cover: (json['cover'] ?? '').toString(),
    index: _toInt(json['index']),
  );
}

}
