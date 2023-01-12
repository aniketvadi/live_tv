import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModal {
  CategoryModal({
    required this.id,
    required this.name,
    required this.image,
  });

  String id;
  String name;
  String image;

  factory CategoryModal.fromJson(DocumentSnapshot<Map<String, dynamic>> doc) =>
      CategoryModal(
        id: doc.id,
        name: doc.data()!["name"],
        image: doc.data()!["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
