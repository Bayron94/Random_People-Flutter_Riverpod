import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:random_people_2024/features/people_random/people_random.dart';

part 'person_model.freezed.dart';
part 'person_model.g.dart';

@freezed
class PersonModel with _$PersonModel {
  const factory PersonModel({
    required String firstName,
    required String lastName,
    required String email,
    required String picture,
  }) = _PersonModel;

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);
}

extension PersonModelX on PersonModel {
  Person toEntity() {
    return Person(
      firstName: firstName,
      lastName: lastName,
      email: email,
      picture: picture,
    );
  }
}
