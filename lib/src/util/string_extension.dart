/// Useful extensions for [String]s.
extension StringExtension on String {
  /// Format the string using the given [parameters].
  String format(final Map<String, dynamic> parameters) =>
      interpolate(this, parameters);
}

/// Find and replace all [parameters] in [string].
String interpolate(final String string, final Map<String, dynamic> parameters) {
  var result = string;
  parameters.forEach(
    (final key, final value) {
      result = result.replaceAll(':{$key}', value.toString());
    },
  );
  return result;
}
