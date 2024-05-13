// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StudentMarkListModel {
  String examid;
  String obtainedGrade;
  String obtainedMark;
  String passMark;
  String studentName;
  String studentid;
  String subjectName;
  String subjectid;
  String teacherId;
  String teachername;
  String uploadDate;

  StudentMarkListModel({
    required this.examid,
    required this.obtainedGrade,
    required this.obtainedMark,
    required this.passMark,
    required this.studentName,
    required this.studentid,
    required this.subjectName,
    required this.subjectid,
    required this.teacherId,
    required this.teachername,
    required this.uploadDate,
  });

  StudentMarkListModel copyWith({
    String? examid,
    String? obtainedGrade,
    String? obtainedMark,
    String? passMark,
    String? studentName,
    String? studentid,
    String? subjectName,
    String? subjectid,
    String? teacherId,
    String? teachername,
    String? uploadDate,
  }) {
    return StudentMarkListModel(
      examid: examid ?? this.examid,
      obtainedGrade: obtainedGrade ?? this.obtainedGrade,
      obtainedMark: obtainedMark ?? this.obtainedMark,
      passMark: passMark ?? this.passMark,
      studentName: studentName ?? this.studentName,
      studentid: studentid ?? this.studentid,
      subjectName: subjectName ?? this.subjectName,
      subjectid: subjectid ?? this.subjectid,
      teacherId: teacherId ?? this.teacherId,
      teachername: teachername ?? this.teachername,
      uploadDate: uploadDate ?? this.uploadDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'examid': examid,
      'obtainedGrade': obtainedGrade,
      'obtainedMark': obtainedMark,
      'passMark': passMark,
      'studentName': studentName,
      'studentid': studentid,
      'subjectName': subjectName,
      'subjectid': subjectid,
      'teacherId': teacherId,
      'teachername': teachername,
      'uploadDate': uploadDate,
    };
  }

  factory StudentMarkListModel.fromMap(Map<String, dynamic> map) {
    return StudentMarkListModel(
      examid: map['examid'] as String,
      obtainedGrade: map['obtainedGrade'] as String,
      obtainedMark: map['obtainedMark'] as String,
      passMark: map['passMark'] as String,
      studentName: map['studentName'] as String,
      studentid: map['studentid'] as String,
      subjectName: map['subjectName'] as String,
      subjectid: map['subjectid'] as String,
      teacherId: map['teacherId'] as String,
      teachername: map['teachername'] as String,
      uploadDate: map['uploadDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentMarkListModel.fromJson(String source) =>
      StudentMarkListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentMarkListModel(examid: $examid, obtainedGrade: $obtainedGrade, obtainedMark: $obtainedMark, passMark: $passMark, studentName: $studentName, studentid: $studentid, subjectName: $subjectName, subjectid: $subjectid, teacherId: $teacherId, teachername: $teachername, uploadDate: $uploadDate)';
  }

  @override
  bool operator ==(covariant StudentMarkListModel other) {
    if (identical(this, other)) return true;

    return other.examid == examid &&
        other.obtainedGrade == obtainedGrade &&
        other.obtainedMark == obtainedMark &&
        other.passMark == passMark &&
        other.studentName == studentName &&
        other.studentid == studentid &&
        other.subjectName == subjectName &&
        other.subjectid == subjectid &&
        other.teacherId == teacherId &&
        other.teachername == teachername &&
        other.uploadDate == uploadDate;
  }

  @override
  int get hashCode {
    return examid.hashCode ^
        obtainedGrade.hashCode ^
        obtainedMark.hashCode ^
        passMark.hashCode ^
        studentName.hashCode ^
        studentid.hashCode ^
        subjectName.hashCode ^
        subjectid.hashCode ^
        teacherId.hashCode ^
        teachername.hashCode ^
        uploadDate.hashCode;
  }
}
