import 'package:json_annotation/json_annotation.dart';

part 'place_response.g.dart';

/// A place response from the API.
@JsonSerializable(
  explicitToJson: true,
)
class PlaceResponse {
  /// Create an instance.
  const PlaceResponse({
    this.placeId,
    this.licence,
    this.osmType,
    this.osmId,
    this.latitude,
    this.longitude,
    this.placeRank,
    this.category,
    this.type,
    this.importance,
    this.addressType,
    this.displayName,
    this.name,
    this.address,
    this.boundingBox,
  });

  /// Create a response from [json].
  factory PlaceResponse.fromJson(final Map<String, dynamic> json) =>
      _$PlaceResponseFromJson(json);

  /// Place ID.
  @JsonKey(name: 'place_id')
  final int? placeId;

  /// Licence.
  @JsonKey(name: 'licence')
  final String? licence;

  /// OSM type.
  @JsonKey(name: 'osm_type')
  final String? osmType;

  /// OSM ID.
  @JsonKey(name: 'osm_id')
  final int? osmId;

  /// Latitude.
  @JsonKey(name: 'lat')
  final String? latitude;

  /// Longitude.
  @JsonKey(name: 'lon')
  final String? longitude;

  /// Place rank.
  @JsonKey(name: 'place_rank')
  final int? placeRank;

  /// Category.
  @JsonKey(name: 'category')
  final String? category;

  /// Type.
  @JsonKey(name: 'type')
  final String? type;

  /// Importance.
  @JsonKey(name: 'importance')
  final double? importance;

  /// Address type.
  @JsonKey(name: 'addresstype')
  final String? addressType;

  /// Display name.
  @JsonKey(name: 'display_name')
  final String? displayName;

  /// Name.
  @JsonKey(name: 'name')
  final String? name;

  /// Address.
  @JsonKey(name: 'address')
  final Address? address;

  /// Bounding box.
  @JsonKey(name: 'boundingbox')
  final List<String>? boundingBox;

  /// Convert to JSON.
  Map<String, dynamic> toJson() => _$PlaceResponseToJson(this);
}

/// An address in a [PlaceResponse].
@JsonSerializable(
  explicitToJson: true,
)
class Address {
  /// Create an instance.
  const Address({
    this.building,
    this.houseNumber,
    this.road,
    this.quarter,
    this.suburb,
    this.village,
    this.cityDistrict,
    this.city,
    this.stateDistrict,
    this.state,
    this.postcode,
    this.country,
    this.countryCode,
  });

  /// Create an instance from [json].
  factory Address.fromJson(final Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  /// Building.
  @JsonKey(name: 'building')
  final String? building;

  /// House number.
  @JsonKey(name: 'house_number')
  final String? houseNumber;

  /// Road.
  @JsonKey(name: 'road')
  final String? road;

  /// Road.
  @JsonKey(name: 'quarter')
  final String? quarter;

  /// The suburb.
  @JsonKey(name: 'suburb')
  final String? suburb;

  /// Village.
  @JsonKey(name: 'village')
  final String? village;

  /// State district.
  @JsonKey(name: 'city_district')
  final String? cityDistrict;

  /// City.
  @JsonKey(name: 'city')
  final String? city;

  /// State district.
  @JsonKey(name: 'state_district')
  final String? stateDistrict;

  /// State.
  @JsonKey(name: 'state')
  final String? state;

  /// Postcode.
  @JsonKey(name: 'postcode')
  final String? postcode;

  /// Country.
  @JsonKey(name: 'country')
  final String? country;

  /// Country code.
  @JsonKey(name: 'country_code')
  final String? countryCode;

  /// Convert to JSON.
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
