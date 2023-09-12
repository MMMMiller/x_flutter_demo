part of 'list_refresh_bloc.dart';

abstract class ListRefreshState<T> {
  final List<T> mList;

  const ListRefreshState(this.mList);
}

class ListRefreshInitial<T> extends ListRefreshState<T> {
  ListRefreshInitial(List<T> mList) : super(mList);
}
