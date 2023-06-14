enum InputState {
  empty('empty'),
  valid('valid'),
  invalid('invalid');

  const InputState(this.value);
  final String value;

  @override
  String toString() => value;
}
