import 'package:equatable/equatable.dart';

// Classes for the events that happen around interaction with the app.

abstract class ImageSearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TextChanged extends ImageSearchEvent {
  final String query;
  TextChanged({this.query});

  @override
  List<Object> get props => [query];

  @override
  String toString() => "ImageSearchTextChanged { query: $query }";
}
