import 'package:chuck_interceptor/chuck.dart';
import 'package:dio/dio.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:get/get.dart' as getx;
import 'package:red_book/data/provider/response_handler.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../../core/constants/constants.dart';
import '../../routes/app_routes.dart';
import '../models/requests/auth_request.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiClient {
  static Chuck alice = Chuck(
    navigatorKey: AppConstants.navigatorKey,
    showNotification: true,
    showInspectorOnShake: false,
    darkTheme: false,
  );

  static get getDio {
    Dio dio = Dio(BaseOptions(followRedirects: false));

    /// chuck interceptor
    dio.interceptors.add(alice.getDioInterceptor());

    /// log
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
        request: true,
      ),
    );

    /// Tries the last error request again.
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        toNoInternetPageNavigator: () async =>
            await getx.Get.toNamed(AppRoutes.internetConnection),
      ),
    );
    return dio;
  }

  static ApiClient? _apiClient;

  static CancelToken cancelToken = CancelToken();

  static ApiClient getInstance({String baseUrl = AppConstants.baseUrl}) {
    if (_apiClient != null) {
      return _apiClient!;
    } else {
      _apiClient = ApiClient(getDio, cancelToken, baseUrl);
      return _apiClient!;
    }
  }

  factory ApiClient(Dio dio, CancelToken cancelToken, String baseUrl) {
    dio.options = BaseOptions(receiveTimeout: 30000, connectTimeout: 30000);
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @GET('/v1/creatures')
  Future<ResponseHandler> getAllAnimals(
    @Query('limit') int limit,
    @Query('page') int page,
    @Query('search') String search,
  );

  @GET('/v1/user')
  Future<ResponseHandler> getAllUsers(
    @Query('limit') int limit,
    @Query('page') int page,
  );

  @POST('/v1/login')
  Future<ResponseHandler> loginRequest(
    @Body() AuthRequest request,
  );
}
