class Event {
  int? id;
  String name;
  String date;
  String location;
  String description;
  String category;
  int userId;

  Event({
    this.id,
    required this.name,
    required this.date,
    required this.location,
    required this.description,
    required this.category,
    required this.userId,
  });

  // Convert Event instance to a Map (for inserting into database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'location': location,
      'description': description,
      'category': category,
      'userId': userId,
    };
  }

  // Convert a Map into an Event instance
  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'],
      name: map['name'],
      date: map['date'],
      location: map['location'],
      description: map['description'],
      category: map['category'],
      userId: map['userId'],
    );
  }
}
