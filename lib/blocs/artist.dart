import 'package:bloc/bloc.dart';
import 'package:challenge/models/artist.dart';
import 'package:challenge/repositories/artist.dart';
import 'package:challenge/resources/response.dart';
import 'package:equatable/equatable.dart';

abstract class ArtistEvent {}

class ArtistLoadEvent extends ArtistEvent {}

abstract class ArtistState with EquatableMixin {}

class ArtistUninitialized extends ArtistState {
  @override
  List get props => const [];
}

class ArtistSuccessState extends ArtistState {
  final List<ArtistModel> artists;

  ArtistSuccessState(this.artists);

  @override
  List get props => artists;
}

class ArtistFailState extends ArtistState {
  final ErrorModel error;

  ArtistFailState(this.error);

  @override
  List get props => [error];
}

class ArtistBloc extends Bloc<ArtistEvent, ArtistState> {
  ArtistBloc() : super(ArtistUninitialized());

  final _repository = ArtistRepository();

  @override
  Stream<ArtistState> mapEventToState(ArtistEvent event) async* {
    if (event is ArtistLoadEvent) yield* _load();
  }

  Stream<ArtistState> _load() async* {
    final response = await _repository.find();
    if (response.isSucessfull) {
      yield ArtistSuccessState(response.data);
    } else {
      yield ArtistFailState(response.error);
    }
  }
}
