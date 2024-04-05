enum EUrgency {
  notUrgent("Not urgent"),
  medium("Medium"),
  urgent("Urgent");

  const EUrgency(this.text);
  final String text;
}

enum EPeopleCount {
  fisrt("1-2"),
  second("3-5"),
  third("More than 5");

  const EPeopleCount(this.text);
  final String text;
}

class MeetingItem {
  String? id;
  String? name;
  DateTime? date;
  EUrgency? urgency;
  EPeopleCount? people;
  String? organizer;
  String? comment;

  MeetingItem(
      {this.id,
      this.name,
      this.date,
      this.organizer,
      this.people,
      this.comment,
      this.urgency});

  factory MeetingItem.fromJson(Map<String, dynamic> parsedJson) {
    return MeetingItem(
      id: parsedJson['id'] ?? "",
      name: parsedJson['name'] ?? "",
      date: DateTime.tryParse(parsedJson['date']),
      organizer: parsedJson['organizer'] ?? "",
      comment: parsedJson['comment'] ?? "",
      people: EPeopleCount.values.byName(parsedJson['people']),
      urgency: EUrgency.values.byName(parsedJson['urgency']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "date": date.toString(),
      "comment": comment,
      "organizer": organizer,
      "people": people!.name,
      "urgency": urgency!.name,
    };
  }
}
