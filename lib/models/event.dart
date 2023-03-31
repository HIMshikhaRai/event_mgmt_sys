// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'dart:convert';

List<Event> eventFromJson(String str) => List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

String eventToJson(List<Event> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Event {
  Event({
    this.id,
    this.name,
    this.description,
    this.address,
    this.startDate,
    this.endDate,
    this.eventPicture,
    this.ticketType,
    this.ticketPrice,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? description;
  String? address;
  DateTime? startDate;
  DateTime? endDate;
  String? eventPicture;
  String? ticketType;
  int? ticketPrice;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    address: json["address"],
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    eventPicture: json["event_picture"],
    ticketType: json["ticket_type"],
    ticketPrice: json["ticket_price"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "address": address,
    "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
    "event_picture": eventPicture,
    "ticket_type": ticketType,
    "ticket_price": ticketPrice,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
