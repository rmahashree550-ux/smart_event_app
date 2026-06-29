import 'dart:convert';
import 'package:flutter/services.dart';

class Event {
  final String id;
  final String eventName;
  final String category;
  final String organizer;
  final String date;
  final String time;
  final String location;
  final double ticketPrice;
  final double rating;
  final String image;
  final String shortDescription;
  final String fullDescription;
  final String venueDetails;
  final String organizerInformation;
  final int availableSeats;
  final List<String> eventSchedule;
  final List<String> photoGallery;
  final String locationMap;

  const Event({
    required this.id,
    required this.eventName,
    required this.category,
    required this.organizer,
    required this.date,
    required this.time,
    required this.location,
    required this.ticketPrice,
    required this.rating,
    required this.image,
    required this.shortDescription,
    required this.fullDescription,
    required this.venueDetails,
    required this.organizerInformation,
    required this.availableSeats,
    required this.eventSchedule,
    required this.photoGallery,
    required this.locationMap,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'] ?? '',
      eventName: json['eventName'] ?? '',
      category: json['category'] ?? '',
      organizer: json['organizer'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      location: json['location'] ?? '',
      ticketPrice: (json['ticketPrice'] ?? 0).toDouble(),
      rating: (json['rating'] ?? 0).toDouble(),
      image: json['image'] ?? '',
      shortDescription: json['shortDescription'] ?? '',
      fullDescription: json['fullDescription'] ?? '',
      venueDetails: json['venueDetails'] ?? '',
      organizerInformation: json['organizerInformation'] ?? '',
      availableSeats: json['availableSeats'] ?? 0,
      eventSchedule: List<String>.from(json['eventSchedule'] ?? []),
      photoGallery: List<String>.from(json['photoGallery'] ?? []),
      locationMap: json['locationMap'] ?? '',
    );
  }

  static Future<List<Event>> loadEvents() async {
    final String response = await rootBundle.loadString('assets/data/events.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Event.fromJson(json)).toList();
  }
}

const List<String> categories = [
  'All', 'Music', 'Sports', 'Technology',
  'Business', 'Education', 'Entertainment',
  'Free Events', 'Paid Events',
];