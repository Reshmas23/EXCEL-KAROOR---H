// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class SubjectModel {
  String docid;
  String subjectName;
  bool subjectNameedit;
  String? teacherId;
  String? teacherName;
  int? subjectFeefortr;
  Color subjectColor;
  SubjectModel({
    required this.docid,
    required this.subjectName,
    required this.subjectNameedit,
    this.teacherId,
    this.teacherName,
    this.subjectFeefortr,
    required this.subjectColor,
  });

  SubjectModel copyWith({
    String? docid,
    String? subjectName,
    bool? subjectNameedit,
    String? teacherId,
    String? teacherName,
    int? subjectFeefortr,
    Color? subjectColor,
  }) {
    return SubjectModel(
      docid: docid ?? this.docid,
      subjectName: subjectName ?? this.subjectName,
      subjectNameedit: subjectNameedit ?? this.subjectNameedit,
      teacherId: teacherId ?? this.teacherId,
      teacherName: teacherName ?? this.teacherName,
      subjectFeefortr: subjectFeefortr ?? this.subjectFeefortr,
      subjectColor: subjectColor ?? this.subjectColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docid': docid,
      'subjectName': subjectName,
      'subjectNameedit': subjectNameedit,
      'teacherId': teacherId,
      'teacherName': teacherName,
      'subjectFeefortr': subjectFeefortr,
      'subjectColor': subjectColor.value,
    };
  }

  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      docid: map['docid'] ??"",
      subjectName: map['subjectName'] ??"",
      subjectNameedit: map['subjectNameedit'] as bool,
      teacherId: map['teacherId'] != null ? map['teacherId'] ??"" : null,
      teacherName: map['teacherName'] != null ? map['teacherName'] ??"" : null,
      subjectFeefortr: map['subjectFeefortr'] != null ? map['subjectFeefortr'] as int : null,
      subjectColor: Color(map['subjectColor'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectModel.fromJson(String source) =>
      SubjectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SubjectModel(docid: $docid, subjectName: $subjectName, subjectNameedit: $subjectNameedit, teacherId: $teacherId, teacherName: $teacherName, subjectFeefortr: $subjectFeefortr, subjectColor: $subjectColor)';
  }

  @override
  bool operator ==(covariant SubjectModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.docid == docid &&
      other.subjectName == subjectName &&
      other.subjectNameedit == subjectNameedit &&
      other.teacherId == teacherId &&
      other.teacherName == teacherName &&
      other.subjectFeefortr == subjectFeefortr &&
      other.subjectColor == subjectColor;
  }

  @override
  int get hashCode {
    return docid.hashCode ^
      subjectName.hashCode ^
      subjectNameedit.hashCode ^
      teacherId.hashCode ^
      teacherName.hashCode ^
      subjectFeefortr.hashCode ^
      subjectColor.hashCode;
  }
}
