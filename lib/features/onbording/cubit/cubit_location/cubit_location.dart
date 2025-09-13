import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:newsapp/features/onbording/cubit/cubit_location/state_location.dart';

import '../../data/repo_location/repo_location.dart';

class LocationCubit extends Cubit<LocationState>{
  LocationCubit() : super(InitialStateLocation());
   static LocationCubit get(context) => BlocProvider.of(context);
  final Completer<GoogleMapController> controller =
  Completer<GoogleMapController>();
  Set<Marker> markers = {};
  TextEditingController Usernamecontroller = TextEditingController();

  changeLocation(LatLng NewLocation)async{
   markers.clear();
   markers.add(
       Marker(
           markerId: MarkerId('New Location'),
           position: NewLocation
       )
   );
   final GoogleMapController mapController = await controller.future;
   mapController.animateCamera(
     CameraUpdate.newLatLng(NewLocation),
   );
   emit(StateSuccess(NewLocation));
  }

  getLocation()async
  {
    RepoLocation repo = RepoLocation();
    emit(StateLoading());
    var response = await repo.getlocation();
    response.fold(ifLeft: (error)=>emit(StateError(error)),
        ifRight: (position)
        {
          LatLng latLng = LatLng(position.latitude, position.longitude);
          markers.add(
              Marker(
                  markerId: MarkerId('current location'),
                  position: latLng
              )
          );
          emit(StateSuccess(latLng));
        }
    );
  }

}