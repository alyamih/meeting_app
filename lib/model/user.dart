enum EMeetingCount {
  fisrt("1-5"),
  second("6-10"),
  third("More than 10");

  const EMeetingCount(this.text);
  final String text;
}

class UserItem {
  String? name;
  EMeetingCount? type;
  String? currency;

  UserItem({this.name, this.type, this.currency});

  factory UserItem.fromJson(Map<String, dynamic> parsedJson) {
    return UserItem(
      name: parsedJson['name'] ?? "",
      type: EMeetingCount.values.byName(parsedJson['type']),
      currency: parsedJson['currency'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "type": type!.name, "currency": currency};
  }
}
