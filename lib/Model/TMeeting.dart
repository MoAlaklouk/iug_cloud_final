class TMeeting {
  String? userName;
  String? des;
  String? trineeTitle;
  String? date;
  String? state;
  TMeeting(
    this.des,
    this.trineeTitle,
    this.date,
    this.userName,
  );

  TMeeting.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    des = json['des'];
    trineeTitle = json['trineeTitle'];
    date = json['date'];
    state = json['state'];
  }
}
