import 'package:google_maps_flutter/google_maps_flutter.dart';
abstract class LocationState{}
class InitialStateLocation extends LocationState{}
class StateLoading extends LocationState{}
class StateSuccess extends LocationState{
  final LatLng latLng;
  StateSuccess( this.latLng);
}
class StateError extends LocationState{
  final String error;

 StateError(this.error);
}