// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AchievementModel {
  String studentName;
  String dateofAchievement;
  String achievementHead;
  String admissionNumber; 
  String uid;
  AchievementModel({
    required this.studentName,
    required this.dateofAchievement,
    required this.achievementHead,
    required this.admissionNumber,
    required this.uid,
  });

  AchievementModel copyWith({
    String? studentName,
    String? dateofAchievement,
    String? achievementHead,
    String? admissionNumber,
    String? uid,
  }) {
    return AchievementModel(
      studentName: studentName ?? this.studentName,
      dateofAchievement: dateofAchievement ?? this.dateofAchievement,
      achievementHead: achievementHead ?? this.achievementHead,
      admissionNumber: admissionNumber ?? this.admissionNumber,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'studentName': studentName,
      'dateofAchievement': dateofAchievement,
      'achievementHead': achievementHead,
      'admissionNumber': admissionNumber,
      'uid': uid,
    };
  }

  factory AchievementModel.fromMap(Map<String, dynamic> map) {
    return AchievementModel(
      studentName: map['studentName'] ?? "",
      dateofAchievement: map['dateofAchievement'] ?? "",
      achievementHead: map['achievementHead'] ?? "",
      admissionNumber: map['admissionNumber'] ?? "",
      uid: map['uid'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory AchievementModel.fromJson(String source) => AchievementModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AchievementModel(studentName: $studentName, dateofAchievement: $dateofAchievement, achievementHead: $achievementHead, admissionNumber: $admissionNumber, uid: $uid)';
  }

  @override
  bool operator ==(covariant AchievementModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.studentName == studentName &&
      other.dateofAchievement == dateofAchievement &&
      other.achievementHead == achievementHead &&
      other.admissionNumber == admissionNumber &&
      other.uid == uid;
  }

  @override
  int get hashCode {
    return studentName.hashCode ^
      dateofAchievement.hashCode ^
      achievementHead.hashCode ^
      admissionNumber.hashCode ^
      uid.hashCode;
  }
}
