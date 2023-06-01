// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'sys.g.dart';

@JsonSerializable(explicitToJson: true)
class Sys {
  final int? type;
  final int? id;
  final String country;
  final int sunrise;
  final int sunset;
  Sys({
    this.type,
    this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
  Map<String, dynamic> toJson() => _$SysToJson(this);
}
