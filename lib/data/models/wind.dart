// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'wind.g.dart';

@JsonSerializable(explicitToJson: true)
class Wind {
  final double speed;
  final int deg;
  final double? dust;

  Wind({
    required this.speed,
    required this.deg,
    this.dust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
  Map<String, dynamic> toJson() => _$WindToJson(this);
}
