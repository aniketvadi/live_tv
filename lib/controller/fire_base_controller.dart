import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:live_tv/modal/category_modal.dart';

class FirebaseController extends GetxController {
  var categoryList = <CategoryModal>[].obs;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> getCategory() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _db.collection('category').get();

    List<CategoryModal> list =
        querySnapshot.docs.map((doc) => CategoryModal.fromJson(doc)).toList();

    categoryList.value = list;
  }
}
