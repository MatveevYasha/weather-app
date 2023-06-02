// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainWeather _$MainWeatherFromJson(Map<String, dynamic> json) => MainWeather(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      tempMax: (json['temp_max'] as num).toDouble(),
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
      seaLevel: json['sea_level'] as int?,
      grndLevel: json['grnd_level'] as int?,
      tempKf: (json['temp_kf'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MainWeatherToJson(MainWeather instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'sea_level': instance.seaLevel,
      'grnd_level': instance.grndLevel,
      'temp_kf': instance.tempKf,
    };
