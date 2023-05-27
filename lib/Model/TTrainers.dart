class TTrainers {
  String? date;
  String? description;
  String? imageUrl;
  String? title;
  String? phone;
  String? email;
  TTrainers({
    required this.date,
    required this.description,
    required this.imageUrl,
    required this.title,
    required this.phone,
    required this.email,
  });
  TTrainers.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    title = json['title'];
    phone = json['phone'];
    email = json['email'];
  }
}
class TTrainersRequest {
  String? date;
  String? description;
  String? imageUrl;
  String? title;
  bool? state;
  TTrainersRequest({
    required this.date,
    required this.description,
    required this.imageUrl,
    required this.title,
    required this.state
  });
  TTrainersRequest.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    title = json['title'];
    state = json['state'];
  }
}
