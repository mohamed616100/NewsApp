import '../data/models/Model_Response.dart';

abstract class newsstate{}
class initialstate extends newsstate{}
class loadingstate extends newsstate{}
class successstate extends newsstate{
  final modelResponseEverything model;

  successstate({required this.model});
}
class errorstate extends newsstate{
  final String erorrmasge;
  errorstate({required this.erorrmasge});
}
