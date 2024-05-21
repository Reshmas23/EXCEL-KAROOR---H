// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TeacherCredentialReport {
  String employeeID;
  String teacherName;
  String teacherEmail;
  String teacherPassword;
  TeacherCredentialReport({
    required this.employeeID,
    required this.teacherName,
    required this.teacherEmail,
    required this.teacherPassword,
  });

  TeacherCredentialReport copyWith({
    String? employeeID,
    String? teacherName,
    String? teacherEmail,
    String? teacherPassword,
  }) {
    return TeacherCredentialReport(
      employeeID: employeeID ?? this.employeeID,
      teacherName: teacherName ?? this.teacherName,
      teacherEmail: teacherEmail ?? this.teacherEmail,
      teacherPassword: teacherPassword ?? this.teacherPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'employeeID': employeeID,
      'teacherName': teacherName,
      'teacherEmail': teacherEmail,
      'teacherPassword': teacherPassword,
    };
  }

  factory TeacherCredentialReport.fromMap(Map<String, dynamic> map) {
    return TeacherCredentialReport(
      employeeID: map['employeeID'] ?? "",
      teacherName: map['teacherName'] ?? '',
      teacherEmail: map['teacherEmail'] ?? '',
      teacherPassword: map['teacherPassword'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherCredentialReport.fromJson(String source) =>
      TeacherCredentialReport.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TeacherCredentialReport(employeeID: $employeeID, teacherName: $teacherName, teacherEmail: $teacherEmail, teacherPassword: $teacherPassword)';
  }

  @override
  bool operator ==(covariant TeacherCredentialReport other) {
    if (identical(this, other)) return true;

    return other.employeeID == employeeID &&
        other.teacherName == teacherName &&
        other.teacherEmail == teacherEmail &&
        other.teacherPassword == teacherPassword;
  }

  @override
  int get hashCode {
    return employeeID.hashCode ^
        teacherName.hashCode ^
        teacherEmail.hashCode ^
        teacherPassword.hashCode;
  }
}
