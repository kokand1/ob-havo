part of 'wather_bloc_bloc.dart';

sealed class WatherBlocEvent extends Equatable {
  const WatherBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WatherBlocEvent {
  final Position position;
  const FetchWeather(this.position);
  @override
  List<Object> get props => [position];
}
