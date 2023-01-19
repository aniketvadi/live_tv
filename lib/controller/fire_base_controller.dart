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
  RxBool isLoading = false.obs;

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
    isLoading(true);
    allCategory.value = await ApiImplement.getCategoryApi();
    if (allCategory.value.categories != null) {
      categoryList.value = allCategory.value.categories!;
    }
    if (allCategory.value.languages != null) {
      languageList.value = allCategory.value.languages!;
    }
    isLoading(false);
  }

  Future<void> getChannelBylanguage({required String lang}) async {
    isLoading(true);
    channelList.value = [];
    channelList.value = await ApiImplement.getChannelApi(language: lang);
    isLoading(false);
  }

  Future<void> getSchedual({required dynamic channel}) async {
    isLoading(true);
    schedualList.value = [];
    schedualList.value = await ApiImplement.getSchedualApi(channel: channel);
    isLoading(false);
  }
}
