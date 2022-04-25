import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/constants/app_keys.dart';

class LocalSource {
  LocalSource();

  LocalSource._();

  static Box? _localStorage;

  static LocalSource? _localSource;

  static LocalSource get instance => _localSource ?? LocalSource._();

  static Future<void> getInstance() async {
    if (_localStorage == null) {
      _localSource ??= LocalSource._();
      _localStorage = await Hive.openBox(AppKeys.localSource);
    }
  }

  Future<void> setShowIntro(bool isShow) async {
    await _localStorage?.put(AppKeys.isShow, isShow);
  }

  bool getShowIntro() {
    return _localStorage?.get(AppKeys.isShow, defaultValue: false) ?? false;
  }

  Future<void> setUserType(String userId) async {
    await _localStorage?.put(AppKeys.userType, userId);
  }

  String getUserType() {
    return _localStorage?.get(AppKeys.userType, defaultValue: "") ?? '';
  }

  Future<void> setLock(String lock) async {
    await _localStorage?.put(AppKeys.lock, lock);
  }

  String getLock() {
    return _localStorage?.get(AppKeys.lock, defaultValue: "") ?? '';
  }

  Future<void> removeProfile() async {
    await _localStorage?.delete(AppKeys.hasProfile);
    await _localStorage?.delete(AppKeys.userType);
    await _localStorage?.delete(AppKeys.user);
    await _localStorage?.delete(AppKeys.lock);
    await _localStorage?.delete(AppKeys.accessToken);
  }

  Future<void> logOut() async {
    await _localStorage?.delete(AppKeys.userType);
  }

  bool hasProfile() {
    return _localStorage?.get(AppKeys.hasProfile, defaultValue: false) ?? false;
  }

  String getAccessToken() {
    return _localStorage?.get(AppKeys.accessToken, defaultValue: "") ?? '';
  }

  Future<void> setRefreshedTokens({
    required String? refreshToken,
    required String? accessToken,
  }) async {
    await _localStorage?.put(AppKeys.accessToken, accessToken ?? '');
  }
}
