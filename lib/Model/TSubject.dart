class TSubject {
  String? title;
  String? image;
  String? des;
  String? advisor;
  TSubject(this.des, this.image, this.title, this.advisor);
  TSubject.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    des = json['des'];
    advisor = json['advisor'];
  }
}
