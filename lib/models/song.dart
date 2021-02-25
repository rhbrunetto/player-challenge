class SongModel {
  final String name;
  final String artistName;
  final String coverUrl;
  final String fileUrl;

  SongModel({
    this.name,
    this.artistName,
    this.coverUrl,
    this.fileUrl,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) => SongModel(
        name: json['name'],
        artistName: json['artistName'],
        coverUrl: json['coverUrl'],
        fileUrl: json['fileUrl'],
      );

  static Iterable<SongModel> fromJsonList(List list) => list == null
      ? const []
      : list.map(
          (item) => SongModel.fromJson(item as Map<String, dynamic>),
        );
}
