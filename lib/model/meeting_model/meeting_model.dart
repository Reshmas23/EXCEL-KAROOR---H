// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MeetingModel {
  String topic;
  String date;
  String time;
  String category;
  String members;
  String specialGuest;
  String venue;
  String meetingId;
  MeetingModel({
    required this.topic,
    required this.date,
    required this.time,
    required this.category,
    required this.members,
    required this.specialGuest,
    required this.venue,
    required this.meetingId,
  });

  MeetingModel copyWith({
    String? topic,
    String? date,
    String? time,
    String? category,
    String? members,
    String? specialGuest,
    String? venue,
    String? meetingId,
  }) {
    return MeetingModel(
      topic: topic ?? this.topic,
      date: date ?? this.date,
      time: time ?? this.time,
      category: category ?? this.category,
      members: members ?? this.members,
      specialGuest: specialGuest ?? this.specialGuest,
      venue: venue ?? this.venue,
      meetingId: meetingId ?? this.meetingId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'topic': topic,
      'date': date,
      'time': time,
      'category': category,
      'members': members,
      'specialGuest': specialGuest,
      'venue': venue,
      'meetingId': meetingId,
    };
  }

  factory MeetingModel.fromMap(Map<String, dynamic> map) {
    return MeetingModel(
      topic: map['topic'] as String,
      date: map['date'] as String,
      time: map['time'] as String,
      category: map['category'] as String,
      members: map['members'] as String,
      specialGuest: map['specialGuest'] as String,
      venue: map['venue'] as String,
      meetingId: map['meetingId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MeetingModel.fromJson(String source) => MeetingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MeetingModel(topic: $topic, date: $date, time: $time, category: $category, members: $members, specialGuest: $specialGuest, venue: $venue, meetingId: $meetingId)';
  }

  @override
  bool operator ==(covariant MeetingModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.topic == topic &&
      other.date == date &&
      other.time == time &&
      other.category == category &&
      other.members == members &&
      other.specialGuest == specialGuest &&
      other.venue == venue &&
      other.meetingId == meetingId;
  }

  @override
  int get hashCode {
    return topic.hashCode ^
      date.hashCode ^
      time.hashCode ^
      category.hashCode ^
      members.hashCode ^
      specialGuest.hashCode ^
      venue.hashCode ^
      meetingId.hashCode;
  }
}
