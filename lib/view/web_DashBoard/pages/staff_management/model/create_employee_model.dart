// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CreateEmployeeClassModel {
  String employeeName;
  String employeeID;
  String mobileNo;
  String? whatsAppNo;
  String emailID;
  String gender;
  String dob;
  String joiningDate;
  String assignRole;
  String? alMobileNo;
  String address;
  String city;
  String district;
  String state;
  int? index;
  String? staffImage;
  CreateEmployeeClassModel({
    required this.employeeName,
    required this.employeeID,
    required this.mobileNo,
    this.whatsAppNo,
    required this.emailID,
    required this.gender,
    required this.dob,
    required this.joiningDate,
    required this.assignRole,
    this.alMobileNo,
    required this.address,
    required this.city,
    required this.district,
    required this.state,
    required this.index,
    this.staffImage,
  });



  CreateEmployeeClassModel copyWith({
    String? employeeName,
    String? employeeID,
    String? mobileNo,
    String? whatsAppNo,
    String? emailID,
    String? gender,
    String? dob,
    String? joiningDate,
    String? assignRole,
    String? alMobileNo,
    String? address,
    String? city,
    String? district,
    String? state,
    int? index,
    String? staffImage,
  }) {
    return CreateEmployeeClassModel(
      employeeName: employeeName ?? this.employeeName,
      employeeID: employeeID ?? this.employeeID,
      mobileNo: mobileNo ?? this.mobileNo,
      whatsAppNo: whatsAppNo ?? this.whatsAppNo,
      emailID: emailID ?? this.emailID,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      joiningDate: joiningDate ?? this.joiningDate,
      assignRole: assignRole ?? this.assignRole,
      alMobileNo: alMobileNo ?? this.alMobileNo,
      address: address ?? this.address,
      city: city ?? this.city,
      district: district ?? this.district,
      state: state ?? this.state,
      index: index ?? this.index,
      staffImage: staffImage ?? this.staffImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'employeeName': employeeName,
      'employeeID': employeeID,
      'mobileNo': mobileNo,
      'whatsAppNo': whatsAppNo??'',
      'emailID': emailID,
      'gender': gender,
      'dob': dob,
      'joiningDate': joiningDate,
      'assignRole': assignRole,
      'alMobileNo': alMobileNo??'',
      'address': address,
      'city': city,
      'district': district,
      'state': state,
      'index': index,
      'staffImage': staffImage??'',
    };
  }

  factory CreateEmployeeClassModel.fromMap(Map<String, dynamic> map) {
    return CreateEmployeeClassModel(
      employeeName: map['employeeName'] as String,
      employeeID: map['employeeID'] as String,
      mobileNo: map['mobileNo'] as String,
      whatsAppNo: map['whatsAppNo'] != null ? map['whatsAppNo'] as String : '',
      emailID: map['emailID'] as String,
      gender: map['gender'] as String,
      dob: map['dob'] as String,
      joiningDate: map['joiningDate'] as String,
      assignRole: map['assignRole'] as String,
      alMobileNo: map['alMobileNo'] != null ? map['alMobileNo'] as String : '',
      address: map['address'] as String,
      city: map['city'] as String,
      district: map['district'] as String,
      state: map['state'] as String,
      index: map['index'] != null ? map['index'] as int : null,
      staffImage: map['staffImage'] != null ? map['staffImage'] as String : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateEmployeeClassModel.fromJson(String source) => CreateEmployeeClassModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CreateEmployeeClassModel(employeeName: $employeeName, employeeID: $employeeID, mobileNo: $mobileNo, whatsAppNo: $whatsAppNo, emailID: $emailID, gender: $gender, dob: $dob, joiningDate: $joiningDate, assignRole: $assignRole, alMobileNo: $alMobileNo, address: $address, city: $city, district: $district, state: $state, index: $index, staffImage: $staffImage)';
  }

  @override
  bool operator ==(covariant CreateEmployeeClassModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.employeeName == employeeName &&
      other.employeeID == employeeID &&
      other.mobileNo == mobileNo &&
      other.whatsAppNo == whatsAppNo &&
      other.emailID == emailID &&
      other.gender == gender &&
      other.dob == dob &&
      other.joiningDate == joiningDate &&
      other.assignRole == assignRole &&
      other.alMobileNo == alMobileNo &&
      other.address == address &&
      other.city == city &&
      other.district == district &&
      other.state == state &&
      other.index == index &&
      other.staffImage == staffImage;
  }

  @override
  int get hashCode {
    return employeeName.hashCode ^
      employeeID.hashCode ^
      mobileNo.hashCode ^
      whatsAppNo.hashCode ^
      emailID.hashCode ^
      gender.hashCode ^
      dob.hashCode ^
      joiningDate.hashCode ^
      assignRole.hashCode ^
      alMobileNo.hashCode ^
      address.hashCode ^
      city.hashCode ^
      district.hashCode ^
      state.hashCode ^
      index.hashCode ^
      staffImage.hashCode;
  }
}
