import 'package:hive/hive.dart';
part 'TUser.g.dart';

@HiveType(typeId: 1)
class TUser extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? password;
  
  TUser({
    this.name,
    this.password,
  });
}
