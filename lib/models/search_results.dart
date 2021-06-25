import 'package:pro_phone_challenge/models/image_base.dart';

class SearchResult {
  final SearchItems searchItems;

  SearchResult({this.searchItems});

  static SearchResult fromJson(dynamic json) {
    return SearchResult(searchItems: SearchItems.fromJson(json["response"]));
  }

}

class SearchItems {
  final List<ImageSearchResult> images;
  SearchItems({this.images});

  static SearchItems fromJson(Map<String, dynamic> json) {
    final items = (json['hits'] as List<dynamic>)
      .map(
          (dynamic item) => ImageSearchResult.fromJson(item as Map<String, dynamic>)
        )
        .toList();
    
    return SearchItems(images: items);
  }
}

class ImageSearchResult {
  final ImageResultItem imageResultItem;
  ImageSearchResult({this.imageResultItem});

  static ImageSearchResult fromJson(dynamic json) {
    return ImageSearchResult(
      imageResultItem: ImageResultItem.fromJson(json),
    );
  }
}

class ImageResultItem {
  final int id; // Id of the image
  final String pageURL; // The page on pixabay where the image can be found
  final String previewURL; // Preview of the image
  final String imageURL; // The location of the image
  final int userId;
  final String userName;
  final String userImageURL; // Image of the user
  final String tags; // Relevant tags for this image

  ImageResultItem({
    this.id,
    this.pageURL,
    this.previewURL,
    this.imageURL,
    this.userId,
    this.userName,
    this.userImageURL,
    this.tags,
  });

  static ImageResultItem fromJson(dynamic json) {
    return ImageResultItem(
      id: json['id'] as int,
      pageURL: json['pageURL'] as String,
      previewURL: json['previewURL'] as String,
      imageURL: json['imageURL'] as String,
      userId: json['userId'] as int,
      userName: json['userName'] as String,
      userImageURL: json['userImageURL'] as String,
      tags: json['tags'] as String,
    );
  }

}