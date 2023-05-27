class TSubject {
  String? title;
  String? image;
  String? des;
 TSubject(this.des, this.image, this.title);
   TSubject.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    des = json['des'];

   }
}
