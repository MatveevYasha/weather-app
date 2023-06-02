// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:weather_app/data/models/city.dart';

import 'package:weather_app/data/models/weather_list.dart';

part 'weather_api.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherApi {
  final String cod;
  final int message;
  final int cnt;
  final List<WeatherList> list;
  final City city;

  WeatherApi({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory WeatherApi.fromJson(Map<String, dynamic> json) =>
      _$WeatherApiFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherApiToJson(this);
}
