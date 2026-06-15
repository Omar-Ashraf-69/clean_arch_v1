import 'package:clean_arch_test/features/user/domain/entities/sub_entities/address_entity.dart';

class UserEntity {
  final String name;
  final String email;
  final AddressEntity address;
  final String phone;

  UserEntity({
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
  });
}
