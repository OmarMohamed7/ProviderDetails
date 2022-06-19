import 'package:dio/dio.dart';

class HttpApi {
  static final dio = Dio(BaseOptions(
      baseUrl: "http://164.92.146.111:5000/v1/",
      connectTimeout: 20000,
      receiveTimeout: 20000));

  final options = Options(
      headers: {},
      contentType: Headers.jsonContentType,
      // contentType: Headers.formUrlEncodedContentType,
      responseType: ResponseType.json);

  static getHomePageData() async {
    final res = await dio.get('Event/homePageEvents',
        queryParameters: {"lat": 30.0594699, "lng": 31.328505});

    return res.data;
  }
}
