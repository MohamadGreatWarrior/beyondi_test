// ignore_for_file: avoid_double_and_int_checks

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:p2p_car_renting/features/sign_in/models/user_model/user_model.dart';
import 'package:p2p_car_renting/global/utils/listenable_flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class UserRepo {
  @factoryMethod
  factory UserRepo() {
    return _instance;
  }

  UserRepo._() : properties = <String, dynamic>{};

  static final UserRepo _instance = UserRepo._();

  UserModel? _user;

  UserModel? get user => _user;

  final flutterSecureStorage = const ListenableFlutterSecureStorage();

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    await getUser();
    await getKey(signUpKey, defaultValue: false);
  }

  bool get isSignedIn => _user != null;

  Future<UserModel?> getUser() async {
    try {
      final json = await flutterSecureStorage.read(key: _userKey);
      if (json != null) {
        _user = UserModel.fromJsonStr(json);
      }
      return _user;
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());
      throw Exception("Can't get the user");
    }
  }

  Future<bool> setUser(UserModel user) async {
    try {
      _user = user;
      await flutterSecureStorage.write(key: _userKey, value: user.toJsonStr());
      return true;
    } catch (e) {
      debugPrint('Error: $e');
      throw Exception("Can't set the user");
    }
  }

  Future<bool> deleteUser() async {
    try {
      _user = null;
      await flutterSecureStorage.delete(key: _userKey);
      return true;
    } catch (e) {
      debugPrint('Error: $e');
      throw Exception("Can't delete the user");
    }
  }

  void registerUserAuthListener(ValueChanged<String?> newListener) {
    flutterSecureStorage.registerListener(
      key: _userKey,
      listener: newListener,
    );
  }

  void unregisterUserAuthListener(ValueChanged<String?> listener) {
    flutterSecureStorage.unregisterListener(
      key: _userKey,
      listener: listener,
    );
  }

  Map<String, dynamic> properties;

  Future<bool> setKey<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();
    bool result = false;

    if (value != null) {
      if (value is bool) {
        result = await prefs.setBool(key, value);
      } else if (value is double) {
        result = await prefs.setDouble(key, value);
      } else if (value is int) {
        result = await prefs.setInt(key, value);
      } else if (value is String) {
        result = await prefs.setString(key, value);
      } else if (value is List<String>) {
        result = await prefs.setStringList(key, value);
      } else {
        throw Exception(
          'The value type is not supported in SharedPreferences.',
        );
      }
    } else {
      throw Exception("Value can't be null.");
    }

    if (result) properties[key] = value;
    return result;
  }

  Future<T> getKey<T>(String key, {T? defaultValue}) async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey(key) && defaultValue == null) {
      throw Exception(
        "The $key key isn't found in SharedPreferences, so default value can't be null.",
      );
    } else if (!prefs.containsKey(key)) {
      final result = await setKey<T>(key, defaultValue as T);
      if (!result) throw Exception("Default value can't be set.");
      return defaultValue;
    } else {
      if (defaultValue is bool) {
        properties[key] = prefs.getBool(key);
      } else if (defaultValue is double) {
        properties[key] = prefs.getDouble(key);
      } else if (defaultValue is int) {
        properties[key] = prefs.getInt(key);
      } else if (defaultValue is String) {
        properties[key] = prefs.getString(key);
      } else if (defaultValue is List<String>) {
        properties[key] = prefs.getStringList(key);
      } else {
        properties[key] = prefs.get(key);
      }
      return properties[key] as T;
    }
  }

  Future<bool> removeKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}

const String _userKey = 'USER_KEY';
const String signUpKey = 'SIGN_UP_KEY';
