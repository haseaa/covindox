class Event {
  late int pk;
  late String title;
  late String date;
  late String start_time;
  late String end_time;

  Event(this.pk, this.date, this.start_time, this.end_time);

  Event.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    title = json['fields']['title'];
    date = json['fields']['date'];
    start_time = json['fields']['start_time'];
    end_time = json['fields']['end_time'];
  }
}
