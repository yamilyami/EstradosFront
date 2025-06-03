abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}

class FormatFailure extends Failure {
  FormatFailure(String message) : super(message);
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure(String message) : super(message);
}
//class ServerFailure extends Failure {}

//lass LocalFailure extends Failure {}
