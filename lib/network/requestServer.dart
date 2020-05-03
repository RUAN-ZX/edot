import 'package:dio/dio.dart';
import 'requestServerConfig.dart';

class HttpRequest{
  static BaseOptions baseoption = BaseOptions(
    baseUrl: BASE_URL,
    connectTimeout: TIMEOUT,
  );
  static final dioI = Dio(baseoption);

  static Future request(String url, {
      String method = 'get',
      Map<String, dynamic> getparams,
      FormData postdata,
  }) async {


    Options options = Options(method: method);
    try {
      final result = await dioI.request(
          url, queryParameters: getparams,data: postdata, options: options);
      return result;
    } on DioError catch(err){
      throw err;

    }

  }

}