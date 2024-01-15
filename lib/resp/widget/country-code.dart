
import 'package:get/get_utils/get_utils.dart';
import 'package:mallturkeya/resp/widget/country-codes.dart';
/// Country element. This is the element that contains all the information
class CountryCode {
  /// the name of the country
  String? name;

  /// the flag of the country
  final String? flagUri;

  /// the country code (IT,AF..)
  final String? code;

  /// the dial code (+39,+93..)
  final String? dialCode;

  CountryCode({
    this.name,
    this.flagUri,
    this.code,
    this.dialCode,
  });
  factory CountryCode.fromCountryCode(String countryCode) {
    var jsonCode = codes.firstWhereOrNull((code) => code['code'] == countryCode);
    return CountryCode.fromJson(jsonCode!);
  }

  factory CountryCode.fromDialCode(String dialCode) {
    final Map<String, String>? jsonCode = codes.firstWhereOrNull(
          (code) => code['dial_code'] == dialCode,
    );
    return CountryCode.fromJson(jsonCode!);
  }
  factory CountryCode.fromJson(Map<String, dynamic> json) {
    return CountryCode(
      name: json['name'],
      code: json['code'],
      dialCode: json['dial_code'],
      flagUri: 'assets/icons/countries/${json['code'].toLowerCase()}.png',
    );
  }

  @override
  String toString() => "$dialCode";

  String toLongString() => "$dialCode ${toCountryStringOnly()}";

  String toCountryStringOnly() {
    return '$_cleanName';
  }

  String? get _cleanName {
    return name?.replaceAll(RegExp(r'[[\]]'), '').split(',').first;
  }
}