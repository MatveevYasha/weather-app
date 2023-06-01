// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather_app/data/models/clouds.dart';
import 'package:weather_app/data/models/coord.dart';
import 'package:weather_app/data/models/main.dart';
import 'package:weather_app/data/models/sys.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/models/wind.dart';

import 'package:json_annotation/json_annotation.dart';

part 'weather_api.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherApi {
  final Coord coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  WeatherApi({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherApi.fromJson(Map<String, dynamic> json) =>
      _$WeatherApiFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherApiToJson(this);
}
