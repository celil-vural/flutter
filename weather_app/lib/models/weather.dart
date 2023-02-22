// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
    Weather({
        this.success,
        this.city,
        this.result,
    });

    bool? success;
    String? city;
    List<Result>? result;

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        success: json["success"],
        city: json["city"],
        result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "city": city,
        "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.date,
        this.day,
        this.icon,
        this.description,
        this.status,
        this.degree,
        this.min,
        this.max,
        this.night,
        this.humidity,
    });

    String? date;
    String? day;
    String? icon;
    String? description;
    String? status;
    String? degree;
    String? min;
    String? max;
    String? night;
    String? humidity;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        date: json["date"],
        day: json["day"],
        icon: json["icon"],
        description: json["description"],
        status: json["status"],
        degree: json["degree"],
        min: json["min"],
        max: json["max"],
        night: json["night"],
        humidity: json["humidity"],
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "day": day,
        "icon": icon,
        "description": description,
        "status": status,
        "degree": degree,
        "min": min,
        "max": max,
        "night": night,
        "humidity": humidity,
    };
}
