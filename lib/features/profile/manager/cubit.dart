import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/features/profile/manager/state.dart';

import '../data/repo/weather_repo.dart';


class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepo weatherRepo;

  WeatherCubit(this.weatherRepo) : super(WeatherInitial());

  Future<void> fetchWeather({required double lat, required double lon}) async {
    emit(WeatherLoading());
    final result = await weatherRepo.getWeather(lat: lat, lon: lon);
    result.fold(
          ifLeft: (failure) => emit(WeatherError(failure.message)),
          ifRight: (weather) => emit(WeatherLoaded(weather)),
    );
  }
}
