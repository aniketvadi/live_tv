import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseController extends GetxController {
  Future<void> getCategory() async {
    var querySnapshot = await FirebaseFirestore.instance.collection('').get();
  }
}
