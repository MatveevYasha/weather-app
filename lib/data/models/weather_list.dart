// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:weather_app/data/models/clouds.dart';
import 'package:weather_app/data/models/main_weather.dart';
import 'package:weather_app/data/models/sys.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/models/wind.dart';

part 'weather_list.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherList {
  final int dt;
  final MainWeather main;
  final List<Weather> weather;
  final Clouds clouds;
  final Wind wind;
  final int visibility;
  final double pop;
  final Sys sys;
  @JsonKey(name: 'dt_txt')
  final String dtTxt;

  WeatherList({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
  });

  factory WeatherList.fromJson(Map<String, dynamic> json) =>
      _$WeatherListFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherListToJson(this);
}
