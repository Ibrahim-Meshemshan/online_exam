 class Failures {
  final String errorMessage;
  Failures({required this.errorMessage});

  @override
  String toString() => errorMessage;
}

class NetworkError extends Failures {
  NetworkError({required String errorMessage}) : super(errorMessage: errorMessage);
}

class ServerError extends Failures {
  ServerError({required String errorMessage}) : super(errorMessage: errorMessage);
}
