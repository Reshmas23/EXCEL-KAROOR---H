// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserDeviceIDModel {
  String uid;
  String batchID;
  String classID;
  String devideID;
  String schoolID;
  String userrole;
  UserDeviceIDModel({
    required this.uid,
    required this.batchID,
    required this.classID,
    required this.devideID,
    required this.schoolID,
    required this.userrole,
  });

  UserDeviceIDModel copyWith({
    String? uid,
    String? batchID,
    String? classID,
    String? devideID,
    String? schoolID,
    String? userrole,
  }) {
    return UserDeviceIDModel(
      uid: uid ?? this.uid,
      batchID: batchID ?? this.batchID,
      classID: classID ?? this.classID,
      devideID: devideID ?? this.devideID,
      schoolID: schoolID ?? this.schoolID,
      userrole: userrole ?? this.userrole,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'batchID': batchID,
      'classID': classID,
      'devideID': devideID,
      'schoolID': schoolID,
      'userrole': userrole,
    };
  }

  factory UserDeviceIDModel.fromMap(Map<String, dynamic> map) {
    return UserDeviceIDModel(
      uid: map['uid'] ??'',
      batchID: map['batchID'] ??'',
      classID: map['classID'] ??'',
      devideID: map['devideID'] ??'',
      schoolID: map['schoolID'] ??'',
      userrole: map['userrole'] ??'',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDeviceIDModel.fromJson(String source) => UserDeviceIDModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserDeviceIDModel(uid: $uid, batchID: $batchID, classID: $classID, devideID: $devideID, schoolID: $schoolID, userrole: $userrole)';
  }

  @override
  bool operator ==(covariant UserDeviceIDModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.uid == uid &&
      other.batchID == batchID &&
      other.classID == classID &&
      other.devideID == devideID &&
      other.schoolID == schoolID &&
      other.userrole == userrole;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      batchID.hashCode ^
      classID.hashCode ^
      devideID.hashCode ^
      schoolID.hashCode ^
      userrole.hashCode;
  }
}
