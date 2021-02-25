class AlbumModel {
  final String name;
  final String year;
  final String coverUrl;

  AlbumModel({
    this.name,
    this.year,
    this.coverUrl,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
        name: json['name'],
        year: json['year'],
        coverUrl: json['coverUrl'],
      );

  static Iterable<AlbumModel> fromJsonList(List list) => list == null
      ? const []
      : list.map(
          (item) => AlbumModel.fromJson(item as Map<String, dynamic>),
        );
}
