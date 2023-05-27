class TAdvisor {
  String? name;
  String? email;
  String? phone;
  String? trainee;
  int? trinerNum;
  TAdvisor({
    required this.name,
    required this.email,
    required this.phone,
    required this.trainee,
    required this.trinerNum,
  });
  TAdvisor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    trainee = json['Trainee'];
    phone = json['phone'];
    email = json['email'];
  }
}
