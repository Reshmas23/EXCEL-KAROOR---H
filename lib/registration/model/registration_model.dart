// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterModel {
  String docid;
  String userName;
  String userClass;
  String userEmail;
  String phoneNumber;
  String parentName;
  String dateofBirth;
  RegisterModel({
    required this.docid,
    required this.userName,
    required this.userClass,
    required this.userEmail,
    required this.phoneNumber,
    required this.parentName,
    required this.dateofBirth,
  });

  RegisterModel copyWith({
    String? docid,
    String? userName,
    String? userClass,
    String? userEmail,
    String? phoneNumber,
    String? parentName,
    String? dateofBirth,
  }) {
    return RegisterModel(
      docid: docid ?? this.docid,
      userName: userName ?? this.userName,
      userClass: userClass ?? this.userClass,
      userEmail: userEmail ?? this.userEmail,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      parentName: parentName ?? this.parentName,
      dateofBirth: dateofBirth ?? this.dateofBirth,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docid': docid,
      'userName': userName,
      'userClass': userClass,
      'userEmail': userEmail,
      'phoneNumber': phoneNumber,
      'parentName': parentName,
      'dateofBirth': dateofBirth,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      docid: map['docid'] as String,
      userName: map['userName'] as String,
      userClass: map['userClass'] as String,
      userEmail: map['userEmail'] as String,
      phoneNumber: map['phoneNumber'] as String,
      parentName: map['parentName'] as String,
      dateofBirth: map['dateofBirth'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) => RegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegisterModel(docid: $docid, userName: $userName, userClass: $userClass, userEmail: $userEmail, phoneNumber: $phoneNumber, parentName: $parentName, dateofBirth: $dateofBirth)';
  }

  @override
  bool operator ==(covariant RegisterModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.docid == docid &&
      other.userName == userName &&
      other.userClass == userClass &&
      other.userEmail == userEmail &&
      other.phoneNumber == phoneNumber &&
      other.parentName == parentName &&
      other.dateofBirth == dateofBirth;
  }

  @override
  int get hashCode {
    return docid.hashCode ^
      userName.hashCode ^
      userClass.hashCode ^
      userEmail.hashCode ^
      phoneNumber.hashCode ^
      parentName.hashCode ^
      dateofBirth.hashCode;
  }
}
