// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'hive_city.g.dart';

@HiveType(typeId: 1)
class HiveCity {
  @HiveField(0)
  String name;
  HiveCity({
    required this.name,
  });
}
