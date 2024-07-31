import 'dart:core';
import 'activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({required this.imageUrl, required this.city, required this.country, required this.description,
      required this.activities, });
}


List<Activity> activities = [
  Activity(
      imageUrl: 'assets/images/venice_gondola.jpg',
      name: 'Gondola',
      type: 'Sightseeing',
      startTimes: ['11:00', '13:00'],
      rating: 4,
      price: 125),

  Activity(
      imageUrl: 'assets/images/cafes.jpg',
      name: 'Cafe',
      type: 'Sightseeing',
      startTimes: ['08:00', '12:00'],
      rating: 4,
      price: 20)
];


List<Destination> destinations = [
  Destination(
      imageUrl: 'assets/images/venice.jpg',
      city: 'Venezia',
      country: 'Italy',
      description: 'Visit Venice for an amazing and romantic adventure',
      activities: activities
  ),

  Destination(
      imageUrl: 'assets/images/saopaulo.jpg',
      city: 'Sao Paulo',
      country: 'Brazil',
      description: 'Visit Sao Paulo for an enjoyable adventure',
      activities: activities
  ),

  Destination(
      imageUrl: 'assets/images/newyork.jpg',
      city: 'New York',
      country: 'USA',
      description: 'Visit New York and survive the great apple',
      activities: activities
  ),


];