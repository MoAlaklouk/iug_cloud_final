class TMeeting {
  String? userName;
  String? trineeName;
  String? trineeTitle;
  String? date;
  TMeeting(
    this.trineeName,
    this.trineeTitle,
    this.date,
    this.userName,
  );

  TMeeting.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    trineeName = json['trineeName'];
    trineeTitle = json['trineeTitle'];
    date = json['date'];
  }
}
