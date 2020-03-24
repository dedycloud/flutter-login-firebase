abstract class UseCase<Type, Payload> {
  Future<Type> call(Payload payload);
}
