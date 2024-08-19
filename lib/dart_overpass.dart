/// A fork of [flutter_overpass](https://pub.dev/packages/flutter_overpass),
/// written in Dart.
///
/// The original [https://pub.dev/packages/flutter_overpass](package) was tied
/// to Flutter. This package doesn't have that constraint.
library;

import 'dart:convert';

import 'package:dio/dio.dart';

import 'src/json/node_response.dart';
import 'src/json/place_response.dart';
import 'src/util/string_extension.dart';

export 'src/json/node_response.dart';
export 'src/json/place_response.dart';

const _nearbyNodesQuery = [
  '[out:json]; ',
  'node(around::{radius},',
  ':{latitude},',
  ':{longitude})',
  '[name]; out body;',
];

/// The main  class for using the API.
class DartOverpass {
  /// Create an instance.
  const DartOverpass({
    required this.dio,
    this.overpassUrl = 'https://overpass-api.de/api/interpreter',
    this.nominatimUrl = 'https://nominatim.openstreetmap.org/reverse',
  });

  /// The HTTP client to use.
  final Dio dio;

  /// The base overpass url to use.
  final String overpassUrl;

  /// The nominatim URL to use.
  final String nominatimUrl;

  /// Return data from [dio].
  ///
  /// If the response code is not 200, [DioException] will be thrown.
  Future<T> getData<T>(
    final Map<String, dynamic> queryParameters, {
    final String? url,
  }) async {
    final response = await dio.get<T>(
      url ?? overpassUrl,
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200) {
      return response.data!;
    }
    throw DioException(
      requestOptions: RequestOptions(
        path: url ?? overpassUrl,
      ),
    );
  }

  /// Get nodes within [radius] of [latitude] and [longitude].
  Future<NodeResponse> getNearbyNodes({
    required final double latitude,
    required final double longitude,
    final double radius = 50.0,
  }) async {
    final data = await getData(
      {
        'data': _nearbyNodesQuery.join().format({
          'latitude': latitude,
          'longitude': longitude,
          'radius': radius,
        }),
      },
    );
    return NodeResponse.fromJson(data);
  }

  /// Get the results of a raw overpassQL [query].
  ///
  /// Example: ```
  /// final rawResults = await flutterOverpass.rawOverpassQL(
  ///   'node(around:200,37.79396544487583,-122.3838801383972);'
  /// );
  /// ```
  ///
  /// If [useOutBody] is `true`, "out body;" will be appended to the query.
  ///
  /// If you wish an output type other than json, set [outputType].
  Future<dynamic> rawOverpassQL({
    required final String query,
    final bool useOutBody = true,
    final String outputType = '[out:json];',
  }) async {
    var queryToExecute = '$outputType$query';
    queryToExecute = useOutBody ? '${queryToExecute}out body;' : queryToExecute;
    final data = await getData(
      {
        'data': queryToExecute,
      },
    );
    return data;
  }

  /// Get a single place from [latitude] and [longitude].
  ///
  /// This endpoint is limited to 1 request per second.
  Future<PlaceResponse> getPlaceFromCoordinate({
    required final double latitude,
    required final double longitude,
  }) async {
    final data = await getData(
      {
        'format': 'jsonv2',
        'lat': latitude,
        'lon': longitude,
      },
      url: nominatimUrl,
    );
    return PlaceResponse.fromJson(data);
  }

  /// Get multiple places from [address].
  ///
  /// This endpoint is limited to 1 request per second.
  Future<List<PlaceResponse>> searchAddress({
    required final String address,
  }) async {
    final url = '$nominatimUrl/search';
    final data = await getData(
      {
        'q': address,
        'format': 'jsonv2',
        'addressdetails': 1,
      },
      url: url,
    );
    final encodedData = jsonEncode(data);
    return List<PlaceResponse>.from(
      (jsonDecode(encodedData) as List<dynamic>).map(
        (final datum) => PlaceResponse.fromJson(datum as Map<String, dynamic>),
      ),
    );
  }
}
