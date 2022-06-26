abstract class ProductFailure implements Exception {}

class DataSourceError implements ProductFailure {
  final String? message;

  DataSourceError({this.message});
}
