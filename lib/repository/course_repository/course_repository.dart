
import 'package:digitalsalt_assignment/data/network/network_api_services.dart';
import 'package:digitalsalt_assignment/res/app_url/app_url.dart';

class CourseRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> courseListApi() async {
    dynamic response = await _apiService.getGetApiResponse(AppUrl.courseListAPiUrl);
    return response;
  }


}