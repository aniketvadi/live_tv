import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:live_tv/modal/category_modal.dart';

class FirebaseController extends GetxController {
  var categoryList = <CategoryModal>[].obs;

  Future<void> getCategory() async {
    var querySnapshot =
        await FirebaseFirestore.instance.collection('category').get();
        print(querySnapshot.docs[0]);

    // var list =
    //     querySnapshot.docs.map((doc) => CategoryModal.fromJson(doc)).toList();

    // if (categoryList.isEmpty) {
    //   categoryList.value = list;
    // }
  }
}
