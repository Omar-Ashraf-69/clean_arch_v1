
import 'package:clean_arch_test/core/database/api/end_points.dart';

class CompanyModel {
  String name;
  String catchPhrase;
  String bs;

  CompanyModel({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
    name: json[ApiKeys.name],
    catchPhrase: json[ApiKeys.catchPhrase],
    bs: json[ApiKeys.bs],
  );

  Map<String, dynamic> toJson() => {
    ApiKeys.name: name,
    ApiKeys.catchPhrase: catchPhrase,
    ApiKeys.bs: bs,
  };
}
