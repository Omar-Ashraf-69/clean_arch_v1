
import 'package:clean_arch_test/core/database/api/end_points.dart';
import 'package:clean_arch_test/features/user/data/models/sub_models/geo_model.dart';
import 'package:clean_arch_test/features/user/domain/entities/sub_entities/address_entity.dart';

class AddressModel extends AddressEntity {
  final String street;
  final String suite;
  final String zipcode;

  AddressModel({
    required this.street,
    required this.suite,
    required this.zipcode,
    required super.city,
    required super.geo,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    street: json[ApiKeys.street],
    suite: json[ApiKeys.suite],
    city: json[ApiKeys.city],
    zipcode: json[ApiKeys.zipcode],
    geo: GeoModel.fromJson(json[ApiKeys.geo]),
  );

  Map<String, dynamic> toJson() => {
    ApiKeys.street: street,
    ApiKeys.suite: suite,
    ApiKeys.city: city,
    ApiKeys.zipcode: zipcode,
    ApiKeys.geo: geo,
  };
}
