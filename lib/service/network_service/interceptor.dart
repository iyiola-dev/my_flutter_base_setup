import 'package:http_interceptor/http_interceptor.dart';

class NetworkInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData? data}) async {
    // int shouldRefresh =
    //     DateTime.parse("time to expire").compareTo(DateTime.now());
    // if (shouldRefresh > 0) {
    //   print("Still Acive");
    //   data.headers['Authorization'] = "Bearer old access token";
    //   return data;
    // } else {
    //   String newToekn = "";
    //   newToekn = 'get new token';
    //   print("New token Updated");
    //   data.headers['Authorization'] = "Bearer $newToekn";
    //   return data;
    // }

    return data!;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print("Response Code => ${data.statusCode}");
    return data;
  }
}
