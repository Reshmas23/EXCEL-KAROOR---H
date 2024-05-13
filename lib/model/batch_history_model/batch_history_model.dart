class BatchHistoryModel {
  String batchid;
  String batchName;
  String? batchcreatedDate;
  String? batchCreatedBy;
  String? totalStudents;
  String? totalStaff;

  BatchHistoryModel({
    required this.batchid,
    required this.batchName,
    this.batchcreatedDate,
    this.batchCreatedBy,
    this.totalStudents,
    this.totalStaff,
  });

  BatchHistoryModel copyWith({
    String? batchid,
    String? batchName,
    String? batchcreatedDate,
    String? batchCreatedBy,
    String? totalStudents,
    String? totalStaff,
  }) =>
      BatchHistoryModel(
        batchid: batchid ?? this.batchid,
        batchName: batchName ?? this.batchName,
        batchcreatedDate: batchcreatedDate ?? this.batchcreatedDate,
        batchCreatedBy: batchCreatedBy ?? this.batchCreatedBy,
        totalStudents: totalStudents ?? this.totalStudents,
        totalStaff: totalStaff ?? this.totalStaff,
      );

  factory BatchHistoryModel.fromJson(Map<String, dynamic> json) =>
      BatchHistoryModel(
        batchid: json["batchid"],
        batchName: json["batchName"],
        batchcreatedDate: json["batchcreatedDate"],
        batchCreatedBy: json["batchCreatedBy"],
        totalStudents: json["totalStudents"],
        totalStaff: json["totalStaff"],
      );

  Map<String, dynamic> toJson() => {
        "batchid": batchid,
        "batchName": batchName,
        "batchcreatedDate": batchcreatedDate,
        "batchCreatedBy": batchCreatedBy,
        "totalStudents": totalStudents,
        "totalStaff": totalStaff,
      };
}
