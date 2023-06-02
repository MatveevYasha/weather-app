// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherList _$WeatherListFromJson(Map<String, dynamic> json) => WeatherList(
      dt: json['dt'] as int,
      main: MainWeather.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      clouds: Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
      visibility: json['visibility'] as int,
      pop: (json['pop'] as num).toDouble(),
      sys: Sys.fromJson(json['sys'] as Map<String, dynamic>),
      dtTxt: json['dt_txt'] as String,
    );

Map<String, dynamic> _$WeatherListToJson(WeatherList instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main.toJson(),
      'weather': instance.weather.map((e) => e.toJson()).toList(),
      'clouds': instance.clouds.toJson(),
      'wind': instance.wind.toJson(),
      'visibility': instance.visibility,
      'pop': instance.pop,
      'sys': instance.sys.toJson(),
      'dt_txt': instance.dtTxt,
    };
