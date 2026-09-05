 class Failures {
  String errorName;
  Failures({required this.errorName});
}
class NetworkError extends Failures{
  NetworkError({required super.errorName});
}
class ServerError extends Failures{
  ServerError({required super.errorName});
}