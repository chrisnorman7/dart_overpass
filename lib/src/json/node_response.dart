import 'package:json_annotation/json_annotation.dart';

part 'node_response.g.dart';

/// A node response from the API.
@JsonSerializable(
  explicitToJson: true,
)
class NodeResponse {
  /// Create an instance.
  const NodeResponse({
    this.version,
    this.generator,
    this.osm,
    this.elements,
  });

  /// Create an instance from [json].
  factory NodeResponse.fromJson(final Map<String, dynamic> json) =>
      _$NodeResponseFromJson(json);

  /// Version of the OSM API.
  @JsonKey(name: 'version')
  final double? version;

  /// Name of the application that created the response.
  @JsonKey(name: 'generator')
  final String? generator;

  /// OSM3S metadata.
  @JsonKey(name: 'osm3s')
  final Osm? osm;

  /// List of nodes.
  @JsonKey(name: 'elements')
  final List<Element>? elements;

  /// Convert to JSON.
  Map<String, dynamic> toJson() => _$NodeResponseToJson(this);
}

/// An element in a [NodeResponse].
@JsonSerializable(
  explicitToJson: true,
)
class Element {
  /// Create an instance.
  const Element({
    this.type,
    this.id,
    this.lat,
    this.lon,
    this.tags,
  });

  /// Create an instance from [json].
  factory Element.fromJson(final Map<String, dynamic> json) =>
      _$ElementFromJson(json);

  /// Type of the element.
  @JsonKey(name: 'type')
  final String? type;

  /// ID of the element.
  @JsonKey(name: 'id')
  final int? id;

  /// Latitude of the element.
  @JsonKey(name: 'lat')
  final double? lat;

  /// Longitude of the element.
  @JsonKey(name: 'lon')
  final double? lon;

  /// Tags of the element.
  @JsonKey(name: 'tags')
  final Tag? tags;

  /// Convert to JSON.
  Map<String, dynamic> toJson() => _$ElementToJson(this);
}

/// A tag in an [Element].
@JsonSerializable(
  explicitToJson: true,
)
class Tag {
  /// Create an instance.
  const Tag({
    this.addrCity,
    this.addrHousenumber,
    this.addrPostcode,
    this.addrStreet,
    this.name,
    this.office,
    this.openingHours,
    this.openingHoursCovid19,
    this.website,
    this.amenity,
    this.beauty,
  });

  /// Create an instance from [json].
  factory Tag.fromJson(final Map<String, dynamic> json) => _$TagFromJson(json);

  /// City of the element.
  @JsonKey(name: 'addr:city')
  final String? addrCity;

  /// House number of the element.
  @JsonKey(name: 'addr:housenumber')
  final String? addrHousenumber;

  /// Postcode of the element.
  @JsonKey(name: 'addr:postcode')
  final String? addrPostcode;

  /// Street of the element.
  @JsonKey(name: 'addr:street')
  final String? addrStreet;

  /// Name of the element.
  @JsonKey(name: 'name')
  final String? name;

  /// Office of the element.
  @JsonKey(name: 'office')
  final String? office;

  /// Opening hours of the element.
  @JsonKey(name: 'opening_hours')
  final String? openingHours;

  /// Opening hours of the element during COVID-19.
  @JsonKey(name: 'opening_hours:covid19')
  final String? openingHoursCovid19;

  /// Website of the element.
  @JsonKey(name: 'website')
  final String? website;

  /// Amenity of the element.
  @JsonKey(name: 'amenity')
  final String? amenity;

  /// Is element is a type place of beauty.
  @JsonKey(name: 'beauty')
  final String? beauty;

  /// Convert to JSON.
  Map<String, dynamic> toJson() => _$TagToJson(this);
}

/// Holds information about an OSM.
@JsonSerializable(
  explicitToJson: true,
)
class Osm {
  /// Create an instance.
  const Osm({
    this.timestampOsmBase,
    this.copyright,
  });

  /// Create an instance from [json].
  factory Osm.fromJson(final Map<String, dynamic> json) => _$OsmFromJson(json);

  /// Timestamp of the OSM base.
  @JsonKey(name: 'timestamp_osm_base')
  final DateTime? timestampOsmBase;

  /// OSM3S metadata.
  @JsonKey(name: 'copyright')
  final String? copyright;

  /// Convert to JSON.
  Map<String, dynamic> toJson() => _$OsmToJson(this);
}
