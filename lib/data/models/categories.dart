import 'package:dro/core/app_export.dart';

/// Simulate a data model
List<Category> categoriesData = [
  Category(title: 'Headache', imageUri: AssetsImages.headachePic),
  Category(title: 'Supplements', imageUri: AssetsImages.supplementsPic),
  Category(title: 'Infants', imageUri: AssetsImages.infantsPic),
  Category(title: 'Cough', imageUri: AssetsImages.coughPic),
];

List<Category> mainCategoryData = [
  Category(title: 'Headache', imageUri: AssetsImages.headachePic),
  Category(title: 'Supplements', imageUri: AssetsImages.supplementsPic),
  Category(title: 'Infants', imageUri: AssetsImages.infantsPic),
  Category(title: 'Cough', imageUri: AssetsImages.coughPic),
];

//data model
class Category {
  String? title;
  String? imageUri;

  Category({this.title, this.imageUri});

  Category.fromJson(Map<String, String> json) {
    title = json['title'];
    imageUri = json['imageUri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, String>{};
    data['title'] = title;
    data['imageUri'] = imageUri;
    return data;
  }
}
