import 'package:http/http.dart';
import 'package:weatherapp/data/remote_services.dart';
import 'package:weatherapp/remote_url.dart';

class ApiService extends RemoteService{
  @override
  Future<Response> getWeatherData(String location) async {
    Map<String, String> queryParameters = {
      'q': location,
      'appid': '47a05e7414848be27b7f9f8d2e393080',
      'units': 'metric'
    };
    final response = await get(Uri.https(RemoteUrls.baseUrl,RemoteUrls.endPoint,queryParameters));
    return response;
  }
}