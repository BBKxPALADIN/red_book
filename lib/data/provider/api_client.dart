import 'package:chuck_interceptor/chuck.dart';
import 'package:dio/dio.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:get/get.dart' as getx;
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../../core/constants/constants.dart';
import '../../routes/app_routes.dart';

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
        // refreshTokenFunction: BaseFunctions.refreshToken,
      ),
    );
  }
}
