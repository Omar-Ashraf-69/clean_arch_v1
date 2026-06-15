
import 'package:clean_arch_test/features/user/domain/entities/sub_entities/geo_entity.dart';

class AddressEntity {
  final String city;
  final GeoEntity geo;

  AddressEntity({required this.city, required this.geo});
}
