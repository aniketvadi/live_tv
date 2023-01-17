import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:live_tv/modal/all_category_modal.dart';
import 'package:live_tv/modal/schedual_modal.dart';

class ApiImplement {
  static var headers = {
    'X-RapidAPI-Key': '11b7bbfa94mshbbe4bc7645fcb51p12da24jsn97c3b460caf0'
  };

  static Future<AllCategoryModal> getCategoryApi() async {
    Uri url =
        Uri.parse('https://indian-tv-schedule.p.rapidapi.com/getCategories');

    http.Response response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return AllCategoryModal.fromJson(json);
    }

    return AllCategoryModal();
  }

  static Future<List<dynamic>> getChannelApi({required String language}) async {
    Uri url = Uri.parse(
        'https://indian-tv-schedule.p.rapidapi.com/searchChannel?lang=$language');

    http.Response response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return data;
    }

    return [];
  }

  static Future<List<SchedualModal>> getSchedualApi(
      {required String channel}) async {
    List<SchedualModal> schedualList = [];
    Uri url = Uri.parse(
        'https://indian-tv-schedule.p.rapidapi.com/Schedule?channel=$channel&offset=2');

    http.Response response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      data.forEach((key, value) {
        schedualList.add(SchedualModal(
            key: key,
            name: value['name'],
            otheDetail: value['other-details'],
            type: value['type']));
      });
      return schedualList;
    }
    return [];
  }
}
