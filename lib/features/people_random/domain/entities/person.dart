import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';

@freezed
class Person with _$Person {
  const factory Person({
    required String id,
    required String fullName,
    required String gender,
    required String email,
    required String phone,
    required String cell,
    required String address,
    required String imageUrl,
  }) = _Person;
}
