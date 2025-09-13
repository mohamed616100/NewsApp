class ApiEndpoints {
  static String weather({
    required String lat,
    required String lon,
    String units = 'metric',
    String apiKey = '39ef56aa87e0f9d833e66cd9111de959',
  }) {
    return 'weather?lat=$lat&lon=$lon&appid=$apiKey&units=$units';
  }

  static String newsEverything({
    required String query,
    String apiKey = '5270ddb4d9694171acc70437ed5433c4',
    int? pageSize,
    int? page ,
   String? language ,
    String? from,
    String? to,
    String? sortBy,
  }) {
    return 'everything?q=$query&apiKey=$apiKey&pageSize=$pageSize&page=$page&language=$language&from=$from&to=$to&sortBy=$sortBy';
  }

  static String newsTopHeadlines({
    required String query,
     required String category ,
    required String country ,
    String apiKey = '5270ddb4d9694171acc70437ed5433c4',
     int? pageSize,
     int? page ,
  }) {
    return 'top-headlines?q=$query&category=$category&country=$country&apiKey=$apiKey&pageSize=$pageSize&page=$page';
  }
}
