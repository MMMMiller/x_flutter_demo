part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  final ThemeData theme;

  const ThemeState(this.theme);
}

class ThemeInitial extends ThemeState {
  const ThemeInitial(super.theme);

  @override
  List<Object> get props => [theme];
}
