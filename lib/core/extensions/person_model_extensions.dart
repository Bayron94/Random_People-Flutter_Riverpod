import 'package:random_people_2024/features/people_random/people_random.dart';

extension PersonModelX on PersonModel {
  String get fullName => '${name.title} ${name.first} ${name.last}';

  String get fullAddress =>
      '${location.city}, ${location.state}, ${location.country}';

  Person toEntity() {
    return Person(
      id: login.uuid,
      fullName: '${name.title} ${name.first} ${name.last}',
      gender: gender,
      email: email,
      phone: phone,
      cell: cell,
      address: '${location.city}, ${location.state}, ${location.country}',
      imageUrl: picture.large,
    );
  }
}
