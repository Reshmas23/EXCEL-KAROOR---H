// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ClassModel {
  String docid;
  String className;
   String classId;
  String? classTeacherdocid;
  String? classTeacherName;
  int? classfee;
  bool editoption;
  bool feeeditoption;
  int workingDaysCount;
  String lastClassDay;
  ClassModel({
    required this.docid,
    required this.className,
    required this.classId,
    this.classTeacherdocid,
    this.classTeacherName,
    this.classfee,
    required this.editoption,
    required this.feeeditoption,
    required this.workingDaysCount,
    required this.lastClassDay,
  });

  ClassModel copyWith({
    String? docid,
    String? className,
    String? classId,
    String? classTeacherdocid,
    String? classTeacherName,
    int? classfee,
    bool? editoption,
    bool? feeeditoption,
    int? workingDaysCount,
    String? lastClassDay,
  }) {
    return ClassModel(
      docid: docid ?? this.docid,
      className: className ?? this.className,
      classId: classId ?? this.classId,
      classTeacherdocid: classTeacherdocid ?? this.classTeacherdocid,
      classTeacherName: classTeacherName ?? this.classTeacherName,
      classfee: classfee ?? this.classfee,
      editoption: editoption ?? this.editoption,
      feeeditoption: feeeditoption ?? this.feeeditoption,
      workingDaysCount: workingDaysCount ?? this.workingDaysCount,
      lastClassDay: lastClassDay ?? this.lastClassDay,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docid': docid,
      'className': className,
      'classId': classId,
      'classTeacherdocid': classTeacherdocid,
      'classTeacherName': classTeacherName,
      'classfee': classfee,
      'editoption': editoption,
      'feeeditoption': feeeditoption,
      'workingDaysCount': workingDaysCount,
      'lastClassDay': lastClassDay,
    };
  }

  factory ClassModel.fromMap(Map<String, dynamic> map) {
    return ClassModel(
      docid: map['docid'] ??"",
      className: map['className'] ??"",
      classId: map['classId'] ??"",
      classTeacherdocid: map['classTeacherdocid'] != null ? map['classTeacherdocid'] ??"" : null,
      classTeacherName: map['classTeacherName'] != null ? map['classTeacherName'] ??"" : null,
      classfee: map['classfee'] != null ? map['classfee'] ??0 : null,
      editoption: map['editoption'] ?? false,
      feeeditoption: map['feeeditoption'] ?? false,
      workingDaysCount: map['workingDaysCount'] ?? 0,
      lastClassDay: map['lastClassDay'] ??"",
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassModel.fromJson(String source) =>
      ClassModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClassModel(docid: $docid, className: $className, classId: $classId, classTeacherdocid: $classTeacherdocid, classTeacherName: $classTeacherName, classfee: $classfee, editoption: $editoption, feeeditoption: $feeeditoption, workingDaysCount: $workingDaysCount, lastClassDay: $lastClassDay)';
  }

  @override
  bool operator ==(covariant ClassModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.docid == docid &&
      other.className == className &&
      other.classId == classId &&
      other.classTeacherdocid == classTeacherdocid &&
      other.classTeacherName == classTeacherName &&
      other.classfee == classfee &&
      other.editoption == editoption &&
      other.feeeditoption == feeeditoption &&
      other.workingDaysCount == workingDaysCount &&
      other.lastClassDay == lastClassDay;
  }

  @override
  int get hashCode {
    return docid.hashCode ^
      className.hashCode ^
      classId.hashCode ^
      classTeacherdocid.hashCode ^
      classTeacherName.hashCode ^
      classfee.hashCode ^
      editoption.hashCode ^
      feeeditoption.hashCode ^
      workingDaysCount.hashCode ^
      lastClassDay.hashCode;
  }
}
