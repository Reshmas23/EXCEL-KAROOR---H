// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StudentCredentialReport {
  String adminNo;
  String studentName;
  String gender;
  String studentEmail;
  String studentPassword;
  String parentEmail;
  String parentPassword;
  StudentCredentialReport({
    required this.adminNo,
    required this.studentName,
    required this.gender,
    required this.studentEmail,
    required this.studentPassword,
    required this.parentEmail,
    required this.parentPassword,
  });
  

  StudentCredentialReport copyWith({
    String? adminNo,
    String? studentName,
    String? gender,
    String? studentEmail,
    String? studentPassword,
    String? parentEmail,
    String? parentPassword,
  }) {
    return StudentCredentialReport(
      adminNo: adminNo ?? this.adminNo,
      studentName: studentName ?? this.studentName,
      gender: gender ?? this.gender,
      studentEmail: studentEmail ?? this.studentEmail,
      studentPassword: studentPassword ?? this.studentPassword,
      parentEmail: parentEmail ?? this.parentEmail,
      parentPassword: parentPassword ?? this.parentPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adminNo': adminNo,
      'studentName': studentName,
      'gender': gender,
      'studentEmail': studentEmail,
      'studentPassword': studentPassword,
      'parentEmail': parentEmail,
      'parentPassword': parentPassword,
    };
  }

  factory StudentCredentialReport.fromMap(Map<String, dynamic> map) {
    return StudentCredentialReport(
      adminNo: map['adminNo'] ??"",
      studentName: map['studentName'] ??"",
      gender: map['gender'] ??"",
      studentEmail: map['studentEmail'] ??"",
      studentPassword: map['studentPassword'] ??"",
      parentEmail: map['parentEmail'] ??"",
      parentPassword: map['parentPassword'] ??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentCredentialReport.fromJson(String source) => StudentCredentialReport.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentCredentialReport(adminNo: $adminNo, studentName: $studentName, gender: $gender, studentEmail: $studentEmail, studentPassword: $studentPassword, parentEmail: $parentEmail, parentPassword: $parentPassword)';
  }

  @override
  bool operator ==(covariant StudentCredentialReport other) {
    if (identical(this, other)) return true;
  
    return 
      other.adminNo == adminNo &&
      other.studentName == studentName &&
      other.gender == gender &&
      other.studentEmail == studentEmail &&
      other.studentPassword == studentPassword &&
      other.parentEmail == parentEmail &&
      other.parentPassword == parentPassword;
  }

  @override
  int get hashCode {
    return adminNo.hashCode ^
      studentName.hashCode ^
      gender.hashCode ^
      studentEmail.hashCode ^
      studentPassword.hashCode ^
      parentEmail.hashCode ^
      parentPassword.hashCode;
  }
}
