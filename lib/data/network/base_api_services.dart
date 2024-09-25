abstract class BaseApiServices {
  
  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getPostApiResponse(dynamic data,String url);
}