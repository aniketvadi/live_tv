import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:live_tv/modal/all_category_modal.dart';
import 'package:live_tv/modal/schedual_modal.dart';
import 'package:live_tv/services/api_implement.dart';

class FirebaseController extends GetxController {
  var categoryList = <String>[].obs;
  var languageList = <String>[].obs;
  var channelList = <dynamic>[].obs;
  var schedualList = <SchedualModal>[].obs;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Rx<AllCategoryModal> allCategory = AllCategoryModal().obs;

  // Future<void> getCategory() async {
  //   var querySnapshot =
  //       await FirebaseFirestore.instance.collection('category').get();
  //       print(querySnapshot.docs[0]);

  //   // var list =
  //   //     querySnapshot.docs.map((doc) => CategoryModal.fromJson(doc)).toList();

  //   // if (categoryList.isEmpty) {
  //   //   categoryList.value = list;
  //   // }
  // }

  Future<void> getCategory() async {
    allCategory.value = await ApiImplement.getCategoryApi();
    if (allCategory.value.categories != null) {
      categoryList.value = allCategory.value.categories!;
    }
    if (allCategory.value.languages != null) {
      languageList.value = allCategory.value.languages!;
    }
  }

  Future<void> getChannelBylanguage({required String lang}) async {
    channelList.value = [];
    channelList.value = await ApiImplement.getChannelApi(language: lang);
  }

  Future<void> getSchedual({required dynamic channel}) async {
    schedualList.value = [];
    schedualList.value = await ApiImplement.getSchedualApi(channel: channel);
  }
}
