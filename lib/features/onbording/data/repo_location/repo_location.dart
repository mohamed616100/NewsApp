import 'package:dart_either/dart_either.dart';
import 'package:geolocator/geolocator.dart';

class RepoLocation{
  Future<Either<String,Position>>getlocation()async{
    try{
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever || permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
      var position = await Geolocator.getCurrentPosition();
      return Right(position);
    }catch(e){
      return Left(e.toString());
    }
  }
}