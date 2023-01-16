class AllCategoryModal {
  List<String>? categories;
  List<String>? languages;

  AllCategoryModal({this.categories, this.languages});

  AllCategoryModal.fromJson(Map<String, dynamic> json) {
    categories = json['categories'].cast<String>();
    languages = json['languages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories'] = categories;
    data['languages'] = languages;
    return data;
  }
}
