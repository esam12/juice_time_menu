import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  Map<String, String> name;
  String image;
  bool isFeature;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeature,
  });

  /// Empty Helper Function
  static CategoryModel empty() {
    return CategoryModel(id: '', name: {}, image: '', isFeature: false);
  }

  /// Convert model to json structure for storing data in firebase
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name.isNotEmpty ? name : {},
      'Image': image,
      'isFeature': isFeature
    };
  }

  // From Json
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['Id']?.toInt() ?? -1,
        name:
            json['Name'] != null ? Map<String, String>.from(json['Name']) : {},
        image: json['Image']?.toString() ?? '',
        isFeature: json['isFeature'] ?? false);
  }

  /// Map JSON oriented document snapshot from firebase to UserModelfactory CategoryModel.fromSnapshot(
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return CategoryModel(
          id: data['Id']?.toInt() ?? -1,
          name: data['Name'] != null
              ? Map<String, String>.from(data['Name'])
              : {},
          image: data['Image']?.toString() ?? '',
          isFeature: data['isFeature'] ?? false);
    } else {
      return CategoryModel.empty();
    }
  }
}