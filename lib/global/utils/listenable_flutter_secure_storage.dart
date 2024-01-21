import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final Map<String, List<ValueChanged<String?>>> _listeners = {};

class ListenableFlutterSecureStorage extends FlutterSecureStorage {
  const ListenableFlutterSecureStorage() : super();

  void registerListener({
    required String key,
    required ValueChanged<String?> listener,
  }) {
    _listeners[key] = [..._listeners[key] ?? [], listener];
  }

  void unregisterListener({
    required String key,
    required ValueChanged<String?> listener,
  }) {
    final listenersForKey = _listeners[key];

    if (listenersForKey == null || listenersForKey.isEmpty) {
      return;
    }

    listenersForKey.remove(listener);
    _listeners[key] = listenersForKey;
  }

  void unregisterAllListenersForKey({required String key}) {
    _listeners.remove(key);
  }

  void unregisterAllListeners() {
    _listeners.clear();
  }

  @override
  Future<void> write({
    required String key,
    required String? value,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    await super.write(
      key: key,
      value: value,
      iOptions: iOptions,
      aOptions: aOptions,
      lOptions: lOptions,
      webOptions: webOptions,
      mOptions: mOptions,
      wOptions: wOptions,
    );

    _callListenersForKey(key, value);
  }

  @override
  Future<void> delete({
    required String key,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    await super.delete(
      key: key,
      iOptions: iOptions,
      aOptions: aOptions,
      lOptions: lOptions,
      webOptions: webOptions,
      mOptions: mOptions,
      wOptions: wOptions,
    );

    _callListenersForKey(key);
  }

  void _callListenersForKey(String key, [String? value]) {
    final listenersForKey = _listeners[key];
    if (listenersForKey == null || listenersForKey.isEmpty) {
      return;
    }

    for (final listener in listenersForKey) {
      listener(value);
    }
  }

  @override
  Future<void> deleteAll({
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    await super.deleteAll(
      iOptions: iOptions,
      aOptions: aOptions,
      lOptions: lOptions,
      webOptions: webOptions,
      mOptions: mOptions,
      wOptions: wOptions,
    );

    _listeners.forEach((key, listeners) {
      for (final listener in listeners) {
        listener(null);
      }
    });
  }
}
