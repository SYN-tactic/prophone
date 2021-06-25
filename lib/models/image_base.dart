// The basic data structure of an image
abstract class ImageBase {
  final int id; // Id of the image
  final String pageURL; // The page on pixabay where the image can be found
  final String previewURL; // Preview of the image
  final String imageURL; // The location of the image
  final int userId;
  final String userName;
  final String userImageURL; // Image of the user
  final String tags; // Relevant tags for this image

  ImageBase({
    this.id,
    this.pageURL,
    this.previewURL,
    this.imageURL,
    this.userId,
    this.userName,
    this.userImageURL,
    this.tags,
  });
}