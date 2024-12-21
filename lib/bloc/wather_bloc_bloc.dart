import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ob_havo/data/my_data.dart';
import 'package:weather/weather.dart';

part 'wather_bloc_event.dart';
part 'wather_bloc_state.dart';

class WatherBlocBloc extends Bloc<WatherBlocEvent, WatherBlocState> {
  WatherBlocBloc() : super(WatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WatherBlocLoading());
      try {
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);
     
        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, 
            event.position.longitude);

        emit(WatherBlocSuccess(weather));
      } catch (e) {
        emit(WatherBlocFailure());
      }
    });
  }
}
