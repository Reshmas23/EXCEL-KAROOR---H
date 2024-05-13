// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ClassFeesModel {
  String docid;
  String feestypeName;
  int fees;
  DateTime createdDate;
  DateTime dueDate;
  ClassFeesModel({
    required this.docid,
    required this.feestypeName,
    required this.fees,
    required this.createdDate,
    required this.dueDate,
  });
  

  ClassFeesModel copyWith({
    String? docid,
    String? feestypeName,
    int? fees,
    DateTime? createdDate,
    DateTime? dueDate,
  }) {
    return ClassFeesModel(
      docid: docid ?? this.docid,
      feestypeName: feestypeName ?? this.feestypeName,
      fees: fees ?? this.fees,
      createdDate: createdDate ?? this.createdDate,
      dueDate: dueDate ?? this.dueDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docid': docid,
      'feestypeName': feestypeName,
      'fees': fees,
      'createdDate': createdDate.millisecondsSinceEpoch,
      'dueDate': dueDate.millisecondsSinceEpoch,
    };
  }

  factory ClassFeesModel.fromMap(Map<String, dynamic> map) {
    return ClassFeesModel(
      docid: map['docid'] ??'',
      feestypeName: map['feestypeName'] ??'',
      fees: map['fees'] ??0,
      createdDate: DateTime.fromMillisecondsSinceEpoch(map['createdDate'] ??0),
      dueDate: DateTime.fromMillisecondsSinceEpoch(map['dueDate'] ??0),
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassFeesModel.fromJson(String source) => ClassFeesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClassFeesModel(docid: $docid, feestypeName: $feestypeName, fees: $fees, createdDate: $createdDate, dueDate: $dueDate)';
  }

  @override
  bool operator ==(covariant ClassFeesModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.docid == docid &&
      other.feestypeName == feestypeName &&
      other.fees == fees &&
      other.createdDate == createdDate &&
      other.dueDate == dueDate;
  }

  @override
  int get hashCode {
    return docid.hashCode ^
      feestypeName.hashCode ^
      fees.hashCode ^
      createdDate.hashCode ^
      dueDate.hashCode;
  }
}
