import 'dart:convert';

import 'package:challenge/models/artist.dart';
import 'package:challenge/resources/paths.dart';
import 'package:challenge/resources/response.dart';
import 'package:flutter/services.dart' show rootBundle;

class ArtistRepository {
  Future<RepositoryResponse<List<ArtistModel>>> find() async {
    try {
      final response = jsonDecode(
        await rootBundle.loadString(Paths.artistsReponse),
      );
      return RepositoryResponse.sucessOnline(
        data: ArtistModel.fromJsonList(response['artists']).toList(),
      );
    } on Exception catch (error) {
      // FIXME: On a real API, handle DioError
      return RepositoryResponse.failure(message: error.toString());
    }
  }
}
