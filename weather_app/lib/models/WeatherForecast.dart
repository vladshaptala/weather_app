import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:weather_app/utils/Constants.dart';

class WeatherForecast {
  final City city;
  final String cod;
  final double message;
  final int cnt;
  final List<WeatherList> list;
  WeatherForecast({
    required this.city,
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
  });

  WeatherForecast copyWith({
    City? city,
    String? cod,
    double? message,
    int? cnt,
    List<WeatherList>? list,
  }) {
    return WeatherForecast(
      city: city ?? this.city,
      cod: cod ?? this.cod,
      message: message ?? this.message,
      cnt: cnt ?? this.cnt,
      list: list ?? this.list,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'city': city.toMap(),
      'cod': cod,
      'message': message,
      'cnt': cnt,
      'list': list.map((x) => x.toMap()).toList(),
    };
  }

  factory WeatherForecast.fromMap(Map<String, dynamic> map) {
    return WeatherForecast(
      city: City.fromMap(map['city']),
      cod: map['cod'],
      message: map['message']?.toDouble(),
      cnt: map['cnt']?.toInt(),
      list: List<WeatherList>.from(
          map['list']?.map((x) => WeatherList.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherForecast.fromJson(String source) =>
      WeatherForecast.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeatherForecast(city: $city, cod: $cod, message: $message, cnt: $cnt, list: $list)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherForecast &&
        other.city == city &&
        other.cod == cod &&
        other.message == message &&
        other.cnt == cnt &&
        listEquals(other.list, list);
  }

  @override
  int get hashCode {
    return city.hashCode ^
        cod.hashCode ^
        message.hashCode ^
        cnt.hashCode ^
        list.hashCode;
  }
}

class City {
  final int id;
  final String name;
  final Coord coord;
  final String country;
  final int population;
  final int timezone;
  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
  });

  City copyWith({
    int? id,
    String? name,
    Coord? coord,
    String? country,
    int? population,
    int? timezone,
  }) {
    return City(
      id: id ?? this.id,
      name: name ?? this.name,
      coord: coord ?? this.coord,
      country: country ?? this.country,
      population: population ?? this.population,
      timezone: timezone ?? this.timezone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'coord': coord.toMap(),
      'country': country,
      'population': population,
      'timezone': timezone,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['id']?.toInt(),
      name: map['name'],
      coord: Coord.fromMap(map['coord']),
      country: map['country'],
      population: map['population']?.toInt(),
      timezone: map['timezone']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String source) => City.fromMap(json.decode(source));

  @override
  String toString() {
    return 'City(id: $id, name: $name, coord: $coord, country: $country, population: $population, timezone: $timezone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is City &&
        other.id == id &&
        other.name == name &&
        other.coord == coord &&
        other.country == country &&
        other.population == population &&
        other.timezone == timezone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        coord.hashCode ^
        country.hashCode ^
        population.hashCode ^
        timezone.hashCode;
  }
}

class Coord {
  final double lon;
  final double lat;
  Coord({
    required this.lon,
    required this.lat,
  });

  Coord copyWith({
    double? lon,
    double? lat,
  }) {
    return Coord(
      lon: lon ?? this.lon,
      lat: lat ?? this.lat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lon': lon,
      'lat': lat,
    };
  }

  factory Coord.fromMap(Map<String, dynamic> map) {
    return Coord(
      lon: map['lon']?.toDouble(),
      lat: map['lat']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Coord.fromJson(String source) => Coord.fromMap(json.decode(source));

  @override
  String toString() => 'Coord(lon: $lon, lat: $lat)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Coord && other.lon == lon && other.lat == lat;
  }

  @override
  int get hashCode => lon.hashCode ^ lat.hashCode;
}

class WeatherList {
  final int dt;
  final int sunrise;
  final int sunset;
  final Temp temp;
  final Feels_like feels_like;
  final int pressure;
  final int humidity;
  final List<Weather> weather;
  final double speed;
  final int deg;
  final double gust;
  final int clouds;
  final int pop;
  WeatherList({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feels_like,
    required this.pressure,
    required this.humidity,
    required this.weather,
    required this.speed,
    required this.deg,
    required this.gust,
    required this.clouds,
    required this.pop,
  });

  WeatherList copyWith({
    int? dt,
    int? sunrise,
    int? sunset,
    Temp? temp,
    Feels_like? feels_like,
    int? pressure,
    int? humidity,
    List<Weather>? weather,
    double? speed,
    int? deg,
    double? gust,
    int? clouds,
    int? pop,
  }) {
    return WeatherList(
      dt: dt ?? this.dt,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      temp: temp ?? this.temp,
      feels_like: feels_like ?? this.feels_like,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      weather: weather ?? this.weather,
      speed: speed ?? this.speed,
      deg: deg ?? this.deg,
      gust: gust ?? this.gust,
      clouds: clouds ?? this.clouds,
      pop: pop ?? this.pop,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dt': dt,
      'sunrise': sunrise,
      'sunset': sunset,
      'temp': temp.toMap(),
      'feels_like': feels_like.toMap(),
      'pressure': pressure,
      'humidity': humidity,
      'weather': weather.map((x) => x.toMap()).toList(),
      'speed': speed,
      'deg': deg,
      'gust': gust,
      'clouds': clouds,
      'pop': pop,
    };
  }

  factory WeatherList.fromMap(Map<String, dynamic> map) {
    return WeatherList(
      dt: map['dt']?.toInt(),
      sunrise: map['sunrise']?.toInt(),
      sunset: map['sunset']?.toInt(),
      temp: Temp.fromMap(map['temp']),
      feels_like: Feels_like.fromMap(map['feels_like']),
      pressure: map['pressure']?.toInt(),
      humidity: map['humidity']?.toInt(),
      weather:
          List<Weather>.from(map['weather']?.map((x) => Weather.fromMap(x))),
      speed: map['speed']?.toDouble(),
      deg: map['deg']?.toInt(),
      gust: map['gust']?.toDouble(),
      clouds: map['clouds']?.toInt(),
      pop: map['pop']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherList.fromJson(String source) =>
      WeatherList.fromMap(json.decode(source));

  @override
  String toString() {
    return 'List(dt: $dt, sunrise: $sunrise, sunset: $sunset, temp: $temp, feels_like: $feels_like, pressure: $pressure, humidity: $humidity, weather: $weather, speed: $speed, deg: $deg, gust: $gust, clouds: $clouds, pop: $pop)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherList &&
        other.dt == dt &&
        other.sunrise == sunrise &&
        other.sunset == sunset &&
        other.temp == temp &&
        other.feels_like == feels_like &&
        other.pressure == pressure &&
        other.humidity == humidity &&
        listEquals(other.weather, weather) &&
        other.speed == speed &&
        other.deg == deg &&
        other.gust == gust &&
        other.clouds == clouds &&
        other.pop == pop;
  }

  @override
  int get hashCode {
    return dt.hashCode ^
        sunrise.hashCode ^
        sunset.hashCode ^
        temp.hashCode ^
        feels_like.hashCode ^
        pressure.hashCode ^
        humidity.hashCode ^
        weather.hashCode ^
        speed.hashCode ^
        deg.hashCode ^
        gust.hashCode ^
        clouds.hashCode ^
        pop.hashCode;
  }

  String getIconUrl() {
    return Constants.WEATHER_IMAGES_URL + weather[0].icon + '.png';
  }
}

class Temp {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final int morn;
  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  Temp copyWith({
    double? day,
    double? min,
    double? max,
    double? night,
    double? eve,
    int? morn,
  }) {
    return Temp(
      day: day ?? this.day,
      min: min ?? this.min,
      max: max ?? this.max,
      night: night ?? this.night,
      eve: eve ?? this.eve,
      morn: morn ?? this.morn,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'min': min,
      'max': max,
      'night': night,
      'eve': eve,
      'morn': morn,
    };
  }

  factory Temp.fromMap(Map<String, dynamic> map) {
    return Temp(
      day: map['day']?.toDouble(),
      min: map['min']?.toDouble(),
      max: map['max']?.toDouble(),
      night: map['night']?.toDouble(),
      eve: map['eve']?.toDouble(),
      morn: map['morn']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Temp.fromJson(String source) => Temp.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Temp(day: $day, min: $min, max: $max, night: $night, eve: $eve, morn: $morn)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Temp &&
        other.day == day &&
        other.min == min &&
        other.max == max &&
        other.night == night &&
        other.eve == eve &&
        other.morn == morn;
  }

  @override
  int get hashCode {
    return day.hashCode ^
        min.hashCode ^
        max.hashCode ^
        night.hashCode ^
        eve.hashCode ^
        morn.hashCode;
  }
}

class Feels_like {
  final double day;
  final double night;
  final double eve;
  final double morn;
  Feels_like({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  Feels_like copyWith({
    double? day,
    double? night,
    double? eve,
    double? morn,
  }) {
    return Feels_like(
      day: day ?? this.day,
      night: night ?? this.night,
      eve: eve ?? this.eve,
      morn: morn ?? this.morn,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'night': night,
      'eve': eve,
      'morn': morn,
    };
  }

  factory Feels_like.fromMap(Map<String, dynamic> map) {
    return Feels_like(
      day: map['day']?.toDouble(),
      night: map['night']?.toDouble(),
      eve: map['eve']?.toDouble(),
      morn: map['morn']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Feels_like.fromJson(String source) =>
      Feels_like.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Feels_like(day: $day, night: $night, eve: $eve, morn: $morn)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Feels_like &&
        other.day == day &&
        other.night == night &&
        other.eve == eve &&
        other.morn == morn;
  }

  @override
  int get hashCode {
    return day.hashCode ^ night.hashCode ^ eve.hashCode ^ morn.hashCode;
  }
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  Weather copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    return Weather(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['id']?.toInt(),
      main: map['main'],
      description: map['description'],
      icon: map['icon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Weather(id: $id, main: $main, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Weather &&
        other.id == id &&
        other.main == main &&
        other.description == description &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return id.hashCode ^ main.hashCode ^ description.hashCode ^ icon.hashCode;
  }
}
