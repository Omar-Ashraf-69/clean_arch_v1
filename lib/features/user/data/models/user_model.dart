import 'package:clean_arch_test/core/database/api/end_points.dart';
import 'package:clean_arch_test/features/user/data/models/sub_models/address_model.dart';
import 'package:clean_arch_test/features/user/data/models/sub_models/company_model.dart';
import 'package:clean_arch_test/features/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final int id;
  final String username;
  final String website;
  final CompanyModel company;

  UserModel({
    required super.name,
    required super.email,
    required super.address,
    required super.phone,
    required this.id,
    required this.username,
    required this.website,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json[ApiKeys.id],
    name: json[ApiKeys.name],
    username: json[ApiKeys.username],
    email: json[ApiKeys.email],
    address: AddressModel.fromJson(json[ApiKeys.address]),
    phone: json[ApiKeys.phone],
    website: json[ApiKeys.website],
    company: CompanyModel.fromJson(json[ApiKeys.company]),
  );

  Map<String, dynamic> toJson() => {
    ApiKeys.id: id,
    ApiKeys.name: name,
    ApiKeys.username: username,
    ApiKeys.email: email,
    ApiKeys.address: address,
    ApiKeys.phone: phone,
    ApiKeys.website: website,
    ApiKeys.company: company.toJson(),
  };
}
