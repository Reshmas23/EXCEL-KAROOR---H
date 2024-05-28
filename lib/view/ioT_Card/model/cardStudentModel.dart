// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CardStudentModel {
  String docid;
  String cardID;
  String studentName;
  String admissionNumber;
  CardStudentModel({
    required this.docid,
    required this.cardID,
    required this.studentName,
    required this.admissionNumber,
  });
  

  CardStudentModel copyWith({
    String? docid,
    String? cardID,
    String? studentName,
    String? admissionNumber,
  }) {
    return CardStudentModel(
      docid: docid ?? this.docid,
      cardID: cardID ?? this.cardID,
      studentName: studentName ?? this.studentName,
      admissionNumber: admissionNumber ?? this.admissionNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docid': docid,
      'cardID': cardID,
      'studentName': studentName,
      'admissionNumber': admissionNumber,
    };
  }

  factory CardStudentModel.fromMap(Map<String, dynamic> map) {
    return CardStudentModel(
      docid: map['docid'] ??'',
      cardID: map['cardID'] ??'',
      studentName: map['studentName'] ??'',
      admissionNumber: map['admissionNumber'] ??'',
    );
  }

  String toJson() => json.encode(toMap());

  factory CardStudentModel.fromJson(String source) => CardStudentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CardStudentModel(docid: $docid, cardID: $cardID, studentName: $studentName, admissionNumber: $admissionNumber)';
  }

  @override
  bool operator ==(covariant CardStudentModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.docid == docid &&
      other.cardID == cardID &&
      other.studentName == studentName &&
      other.admissionNumber == admissionNumber;
  }

  @override
  int get hashCode {
    return docid.hashCode ^
      cardID.hashCode ^
      studentName.hashCode ^
      admissionNumber.hashCode;
  }
}
