import 'package:pro_phone_challenge/models/image_base.dart';
import 'package:pro_phone_challenge/data/image_client.dart';

class ImageData {
  final ImageClient client; 

  ImageData(this.client);

  Future<List<ImageBase>> searchImages(String query) async {
    final imagesList = await client.searchImages(query);
    return imagesList;
  }
}