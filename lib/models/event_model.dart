import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  String eventId;
  String name;
  String location;
  double latitude;
  double longitude;
  String imageUrl;
  String organizer;
  String category;
  String subcategory;
  String description;
  String information;
  double rating;
  int price;
  String status;
  Timestamp openingTime;
  Timestamp closingTime;
  Timestamp createdAt;
  Timestamp? updatedAt;

  EventModel({
    required this.eventId,    
    required this.name,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.imageUrl,
    required this.organizer,
    required this.category,
    required this.subcategory,
    required this.description,
    required this.information,
    required this.rating,
    required this.price,
    required this.status,
    required this.openingTime,
    required this.closingTime,
    required this.createdAt,
    this.updatedAt,
  });

  // Membuat instance Event dari Map (data Firestore)
  factory EventModel.fromMap(Map<String, dynamic> map, String eventId) {
    return EventModel(
      eventId: eventId,
      name: map['name'],
      location: map['location'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      imageUrl: map['imageUrl'],
      organizer: map['organizer'],
      category: map['category'],
      subcategory: map['subcategory'],
      description: map['description'],
      information: map['information'],
      rating: map['rating'],
      price: map['price'],
      status: map['status'],
      openingTime: map['openingTime'],
      closingTime: map['closingTime'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  // Mengonversi instance Event ke Map untuk disimpan di Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'imageUrl': imageUrl,
      'organizer': organizer,
      'category': category,
      'subcategory': subcategory,
      'description': description,
      'information': information,
      'rating': rating,
      'price': price,
      'status': status,
      'openingTime': openingTime,
      'closingTime': closingTime,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  } // Menambahkan copyWith method

  EventModel copyWith({
    String? eventId,
    String? name,
    String? location,
    double? latitude,
    double? longitude,
    String? imageUrl,
    String? organizer,
    String? category,
    String? subcategory,
    String? description,
    String? information,
    double? rating,
    int? price,
    String? status,
    Timestamp? openingTime,
    Timestamp? closingTime,
    Timestamp? createdAt,
    Timestamp? updatedAt,
  }) {
    return EventModel(
      eventId: eventId ?? this.eventId,
      name: name ?? this.name,
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      imageUrl: imageUrl ?? this.imageUrl,
      organizer: organizer ?? this.organizer,
      category: category ?? this.category,
      subcategory: subcategory ?? this.subcategory,
      description: description ?? this.description,
      information: information ?? this.information,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      status: status ?? this.status,
      openingTime: openingTime ?? this.openingTime,
      closingTime: closingTime ?? this.closingTime,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
