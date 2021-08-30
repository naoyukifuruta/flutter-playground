class TimeCard {
  TimeCard(this.id, this.targetDate, this.startTimeString, this.endTimeString,
      this.createdAt, this.updatedAt);

  int id;
  DateTime targetDate;
  String startTimeString;
  String endTimeString;
  DateTime createdAt;
  DateTime updatedAt;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'targetAt': targetDate.toIso8601String(),
      'start': startTimeString,
      'end': endTimeString,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory TimeCard.fromMap(Map<String, dynamic> json) => TimeCard(
        json["id"],
        DateTime.parse(json["targetAt"]).toLocal(),
        json["start"],
        json["end"],
        DateTime.parse(json["createdAt"]).toLocal(),
        DateTime.parse(json["updatedAt"]).toLocal(),
      );

  @override
  String toString() {
    //return 'TimeCard{id: $id, title: $targetDate, createdAt: $createdAt}';
    return ''; // TODO:
  }
}
