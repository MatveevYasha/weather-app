// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherApi _$WeatherApiFromJson(Map<String, dynamic> json) => WeatherApi(
      cod: json['cod'] as String,
      message: json['message'] as int,
      cnt: json['cnt'] as int,
      list: (json['list'] as List<dynamic>)
          .map((e) => WeatherList.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: City.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherApiToJson(WeatherApi instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.list.map((e) => e.toJson()).toList(),
      'city': instance.city.toJson(),
    };
