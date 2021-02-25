import 'package:challenge/models/album.dart';
import 'package:challenge/models/song.dart';

class ArtistModel {
  final String name;
  final int songsCount;
  final String followers;
  final int following;
  final String coverUrl;
  final List<AlbumModel> albums;
  final List<SongModel> popularSongs;

  ArtistModel({
    this.name,
    this.songsCount,
    this.followers,
    this.following,
    this.coverUrl,
    this.albums,
    this.popularSongs,
  });

  factory ArtistModel.fromJson(Map<String, dynamic> json) => ArtistModel(
        name: json['name'],
        songsCount: json['songsCount'],
        followers: json['followers'],
        following: json['following'],
        coverUrl: json['coverUrl'],
        albums: AlbumModel.fromJsonList(json['albums'] as List).toList(),
        popularSongs: SongModel.fromJsonList(json['populars'] as List).toList(),
      );

  static Iterable<ArtistModel> fromJsonList(List list) => list == null
      ? const []
      : list.map(
          (item) => ArtistModel.fromJson(item as Map<String, dynamic>),
        );
}
