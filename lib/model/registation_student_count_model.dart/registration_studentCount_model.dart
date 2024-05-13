// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegistrationStudentCountModel {
  String className;
  String classID;
  int studentCount;
  RegistrationStudentCountModel({
    required this.className,
    required this.classID,
    required this.studentCount,
  });
  

  RegistrationStudentCountModel copyWith({
    String? className,
    String? classID,
    int? studentCount,
  }) {
    return RegistrationStudentCountModel(
      className: className ?? this.className,
      classID: classID ?? this.classID,
      studentCount: studentCount ?? this.studentCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'className': className,
      'classID': classID,
      'studentCount': studentCount,
    };
  }

  factory RegistrationStudentCountModel.fromMap(Map<String, dynamic> map) {
    return RegistrationStudentCountModel(
      className: map['className'] ??'',
      classID: map['classID'] ??'',
      studentCount: map['studentCount'] ??0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistrationStudentCountModel.fromJson(String source) => RegistrationStudentCountModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RegistrationStudentCountModel(className: $className, classID: $classID, studentCount: $studentCount)';

  @override
  bool operator ==(covariant RegistrationStudentCountModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.className == className &&
      other.classID == classID &&
      other.studentCount == studentCount;
  }

  @override
  int get hashCode => className.hashCode ^ classID.hashCode ^ studentCount.hashCode;
}
