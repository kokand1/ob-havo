part of 'wather_bloc_bloc.dart';

sealed class WatherBlocState extends Equatable {
  const WatherBlocState();

  @override
  List<Object> get props => [];
}

final class WatherBlocInitial extends WatherBlocState {}

final class WatherBlocLoading extends WatherBlocState {}

final class WatherBlocFailure extends WatherBlocState {}

final class WatherBlocSuccess extends WatherBlocState {
  final Weather weather;
  const WatherBlocSuccess(this.weather);
  @override
  List<Object> get props => [weather];
}
