
import 'package:clean_arch_test/core/database/api/end_points.dart';
import 'package:clean_arch_test/features/user/domain/entities/sub_entities/geo_entity.dart';

class GeoModel extends GeoEntity {
  GeoModel({required super.lat, required super.lng});

  factory GeoModel.fromJson(Map<String, dynamic> json) =>
      GeoModel(lat: json[ApiKeys.lat], lng: json[ApiKeys.lng]);

  Map<String, dynamic> toJson() => {ApiKeys.lat: lat, ApiKeys.lng: lng};
}
