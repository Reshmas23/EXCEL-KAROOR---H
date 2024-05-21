// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final studentModel = studentModelFromJson(jsonString);

import 'dart:convert';

class StudentModel {
  String admissionNumber;
  String alPhoneNumber;
  String bloodgroup;
  String classId;
  String createDate;
  String dateofBirth;
  String district;
  String docid;
  String gender;
  String guardianId;
  String houseName;
  String parentId;
  String parentPhoneNumber;
  String place;
  String profileImageId;
  String profileImageUrl;
  String studentName;
  String password;
  String studentemail;
  String userRole = 'student';
  String nameofParent;
  String nameofClass;
  StudentModel({
    required this.admissionNumber,
    required this.alPhoneNumber,
    required this.bloodgroup,
    required this.classId,
    required this.createDate,
    required this.dateofBirth,
    required this.district,
    required this.docid,
    required this.gender,
    required this.guardianId,
    required this.houseName,
    required this.parentId,
    required this.parentPhoneNumber,
    required this.place,
    required this.profileImageId,
    required this.profileImageUrl,
    required this.studentName,
    required this.password,
    required this.studentemail,
    required this.userRole,
    required this.nameofParent,
    required this.nameofClass,
  });

  StudentModel copyWith({
    String? admissionNumber,
    String? alPhoneNumber,
    String? bloodgroup,
    String? classId,
    String? createDate,
    String? dateofBirth,
    String? district,
    String? docid,
    String? gender,
    String? guardianId,
    String? houseName,
    String? parentId,
    String? parentPhoneNumber,
    String? place,
    String? profileImageId,
    String? profileImageUrl,
    String? studentName,
    String? password,
    String? studentemail,
    String? userRole,
    String? nameofParent,
    String? nameofClass,
  }) {
    return StudentModel(
      admissionNumber: admissionNumber ?? this.admissionNumber,
      alPhoneNumber: alPhoneNumber ?? this.alPhoneNumber,
      bloodgroup: bloodgroup ?? this.bloodgroup,
      classId: classId ?? this.classId,
      createDate: createDate ?? this.createDate,
      dateofBirth: dateofBirth ?? this.dateofBirth,
      district: district ?? this.district,
      docid: docid ?? this.docid,
      gender: gender ?? this.gender,
      guardianId: guardianId ?? this.guardianId,
      houseName: houseName ?? this.houseName,
      parentId: parentId ?? this.parentId,
      parentPhoneNumber: parentPhoneNumber ?? this.parentPhoneNumber,
      place: place ?? this.place,
      profileImageId: profileImageId ?? this.profileImageId,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      studentName: studentName ?? this.studentName,
      password: password ?? this.password,
      studentemail: studentemail ?? this.studentemail,
      userRole: userRole ?? this.userRole,
      nameofParent: nameofParent ?? this.nameofParent,
      nameofClass: nameofClass ?? this.nameofClass,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'admissionNumber': admissionNumber,
      'alPhoneNumber': alPhoneNumber,
      'bloodgroup': bloodgroup,
      'classId': classId,
      'createDate': createDate,
      'dateofBirth': dateofBirth,
      'district': district,
      'docid': docid,
      'gender': gender,
      'guardianId': guardianId,
      'houseName': houseName,
      'parentId': parentId,
      'parentPhoneNumber': parentPhoneNumber,
      'place': place,
      'profileImageId': profileImageId,
      'profileImageUrl': profileImageUrl,
      'studentName': studentName,
      'password': password,
      'studentemail': studentemail,
      'userRole': userRole,
      'nameofParent': nameofParent,
      'nameofClass': nameofClass,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      admissionNumber: map['admissionNumber'] ?? '',
      alPhoneNumber: map['alPhoneNumber'] ?? '',
      bloodgroup: map['bloodgroup'] ?? '',
      classId: map['classId'] ?? '',
      createDate: map['createDate'] ?? '',
      dateofBirth: map['dateofBirth'] ?? '',
      district: map['district'] ?? '',
      docid: map['docid'] ?? '',
      gender: map['gender'] ?? '',
      guardianId: map['guardianId'] ?? '',
      houseName: map['houseName'] ?? '',
      parentId: map['parentId'] ?? '',
      parentPhoneNumber: map['parentPhoneNumber'] ?? '',
      place: map['place'] ?? '',
      profileImageId: map['profileImageId'] ?? '',
      profileImageUrl: map['profileImageUrl'] ?? '',
      studentName: map['studentName'] ?? '',
      password: map['password'] ?? '',
      studentemail: map['studentemail'] ?? '',
      userRole: map['userRole'] ?? '',
      nameofParent: map['nameofParent'] ?? '',
      nameofClass: map['nameofClass'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentModel(admissionNumber: $admissionNumber, alPhoneNumber: $alPhoneNumber, bloodgroup: $bloodgroup, classId: $classId, createDate: $createDate, dateofBirth: $dateofBirth, district: $district, docid: $docid, gender: $gender, guardianId: $guardianId, houseName: $houseName, parentId: $parentId, parentPhoneNumber: $parentPhoneNumber, place: $place, profileImageId: $profileImageId, profileImageUrl: $profileImageUrl, studentName: $studentName, password: $password, studentemail: $studentemail, userRole: $userRole, nameofParent: $nameofParent, nameofClass: $nameofClass)';
  }

  @override
  bool operator ==(covariant StudentModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.admissionNumber == admissionNumber &&
      other.alPhoneNumber == alPhoneNumber &&
      other.bloodgroup == bloodgroup &&
      other.classId == classId &&
      other.createDate == createDate &&
      other.dateofBirth == dateofBirth &&
      other.district == district &&
      other.docid == docid &&
      other.gender == gender &&
      other.guardianId == guardianId &&
      other.houseName == houseName &&
      other.parentId == parentId &&
      other.parentPhoneNumber == parentPhoneNumber &&
      other.place == place &&
      other.profileImageId == profileImageId &&
      other.profileImageUrl == profileImageUrl &&
      other.studentName == studentName &&
      other.password == password &&
      other.studentemail == studentemail &&
      other.userRole == userRole &&
      other.nameofParent == nameofParent &&
      other.nameofClass == nameofClass;
  }

  @override
  int get hashCode {
    return admissionNumber.hashCode ^
      alPhoneNumber.hashCode ^
      bloodgroup.hashCode ^
      classId.hashCode ^
      createDate.hashCode ^
      dateofBirth.hashCode ^
      district.hashCode ^
      docid.hashCode ^
      gender.hashCode ^
      guardianId.hashCode ^
      houseName.hashCode ^
      parentId.hashCode ^
      parentPhoneNumber.hashCode ^
      place.hashCode ^
      profileImageId.hashCode ^
      profileImageUrl.hashCode ^
      studentName.hashCode ^
      password.hashCode ^
      studentemail.hashCode ^
      userRole.hashCode ^
      nameofParent.hashCode ^
      nameofClass.hashCode;
  }
}
