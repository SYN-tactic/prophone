import 'package:equatable/equatable.dart';
import 'package:pro_phone_challenge/models/image_base.dart';

// Classes for tracking the current state of an image search and the images that have been 
// returned therein.

abstract class ImageSearchState extends Equatable {
  ImageSearchState([List props = const []]);
}

class SearchStateLoading extends ImageSearchState {
  @override
  List<Object> get props => ['Loading'];

  @override
  String toString() => 'SearchStateLoading';
}

class SearchStateEmpty extends ImageSearchState {
  @override
  List<Object> get props => [null];

  @override
  String toString() => 'SearchStateEmpty';
}

class SearchStateSuccess extends ImageSearchState {
  final List<ImageBase> images;
  final String query;

  SearchStateSuccess(this.images, this.query) : super([images]);

  @override
  List<ImageBase> get props => images;

  @override
  String toString() => 'SearchStateSuccess { images: ${images.length} }';
}

class SearchStateError extends ImageSearchState {
  final String error;

  SearchStateError(this.error) : super([error]);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'SearchStateError { error: $error }';
}