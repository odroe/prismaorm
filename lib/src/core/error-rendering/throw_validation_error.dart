import '../errors/validation_error.dart';

Never throwValidationError({
  required final Iterable<ValidationError> errors,
  required final Map args,
  required final String originalMethod,
  required final String clientVersion,
}) {
  throw UnimplementedError(); // TODO: throwValidationError
}