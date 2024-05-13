// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GeneralInstructionsModel {
  String instruction;
  String instructionId;
  String time;
  GeneralInstructionsModel({
    required this.instruction,
    required this.instructionId,
    required this.time,
  });

  GeneralInstructionsModel copyWith({
    String? instruction,
    String? instructionId,
    String? time,
  }) {
    return GeneralInstructionsModel(
      instruction: instruction ?? this.instruction,
      instructionId: instructionId ?? this.instructionId,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'instruction': instruction,
      'instructionId': instructionId,
      'time': time,
    };
  }

  factory GeneralInstructionsModel.fromMap(Map<String, dynamic> map) {
    return GeneralInstructionsModel(
      instruction: map['instruction'] as String,
      instructionId: map['instructionId'] as String,
      time: map['time'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeneralInstructionsModel.fromJson(String source) => GeneralInstructionsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GeneralInstructionsModel(instruction: $instruction, instructionId: $instructionId, time: $time)';

  @override
  bool operator ==(covariant GeneralInstructionsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.instruction == instruction &&
      other.instructionId == instructionId &&
      other.time == time;
  }

  @override
  int get hashCode => instruction.hashCode ^ instructionId.hashCode ^ time.hashCode;
}
