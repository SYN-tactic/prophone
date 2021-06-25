import 'package:bloc/bloc.dart';
import 'package:pro_phone_challenge/blocs/image_search/image_search_events.dart';
import 'package:pro_phone_challenge/blocs/image_search/image_search_state.dart';
import 'package:pro_phone_challenge/data/image_data.dart';

class ImageSearchBloc extends Bloc<ImageSearchEvent, ImageSearchState> {
  final ImageData imageData;

  ImageSearchBloc({this.imageData});

  @override
  Stream<ImageSearchState> mapEventToState(ImageSearchEvent event) async* {
    if (event is TextChanged) {
      yield* _mapImageSearchTextChangedToState(event);
    }
  }

  Stream<ImageSearchState> _mapImageSearchTextChangedToState(
      TextChanged event) async* {
    final String searchQuery = event.query;
    if (searchQuery.isEmpty) {
      yield SearchStateEmpty();
    } else {
      yield SearchStateLoading();
      try {
        final result = await imageData.searchImages(searchQuery);
        yield SearchStateSuccess(result, searchQuery);
      } catch (error) {
        yield SearchStateError("An error occurred");
      }
    }
  }
}