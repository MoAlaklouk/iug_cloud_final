class TActivity {
  String? title;
  String? user;
  String? state;
  DateTime? time;
  String? description;

  TActivity({
    this.title,
    this.user,
    this.time,
    this.state,
    this.description,
  });

  TActivity.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    user = json['user'];
    time = json['time'];
    state = json['state'];
    description = json['description'];
  }
}
