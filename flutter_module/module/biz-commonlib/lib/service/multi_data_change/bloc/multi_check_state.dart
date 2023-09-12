
abstract class BcMultiCheckState<T> {
  final List<T> checkList;

  const BcMultiCheckState(this.checkList);
}

class InitialBcMultiCheckState<T> extends BcMultiCheckState<T> {
  InitialBcMultiCheckState(super.checkList);
}
