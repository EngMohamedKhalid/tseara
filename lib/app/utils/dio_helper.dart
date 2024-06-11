import 'package:dio/dio.dart';

import '../services/cache_service.dart';
import 'get_it_injection.dart';

class DioHelper{
  static late Dio dio;
  static init(){
    dio = Dio(
        BaseOptions(
            baseUrl: "http://ts3ra.runasp.net/api/",
            receiveDataWhenStatusError: true
        ),
    );
    dio.interceptors.add(DioInterceptor());
  }


  static Future<Response>getData({required String url , Map<String,dynamic>? queryParameters}) async{
    return await  dio.get(
        url,
        queryParameters:queryParameters,
    );

  }

  static Future<Response>postData({required String url ,  Map<String,dynamic>? queryParameters, required Map<String,dynamic> data}) async{
    return await  dio.post(
        url,
        queryParameters:queryParameters,
      data: data,
    );
  }
  static Future<Response>postWithFormData({required String url ,  Map<String,dynamic>? queryParameters, required FormData data}) async{
    return await  dio.post(
        url,
        queryParameters:queryParameters,
      data: data,
    );
  }

  static Future<Response>patchData({required String url ,  Map<String,dynamic>? queryParameters, required Map<String,dynamic> data}) async{
    return await  dio.patch(
        url,
        queryParameters:queryParameters,
      data: data,
    );
  }
  static Future<Response>putData({required String url ,  Map<String,dynamic>? queryParameters, required Map<String,dynamic> data}) async{
    return await  dio.put(
        url,
        queryParameters:queryParameters,
      data: data,
    );
  }
  static Future<Response>deleteData({required String url ,  Map<String,dynamic>? queryParameters, Map<String,dynamic>? data}) async{
    return await  dio.delete(
        url,
        queryParameters:queryParameters,
      data: data,
    );
  }
}


class DioInterceptor extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    options.headers["Authorization"] = await getIt<CacheService>().getUserToken();
    options.headers["Content-Type"] = "application/json";
    super.onRequest(options, handler);
  }
}