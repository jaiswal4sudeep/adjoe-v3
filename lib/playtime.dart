import 'dart:async';

import 'package:flutter/services.dart';

class Playtime {
  static const int _EVENT_TEASER_SHOWN = 14;

  static const MethodChannel _channel = const MethodChannel('playtime');

  static Future<void> init(String sdkHash, [PlaytimeOptions? options]) async {
    return _channel.invokeMethod('init', {
      'sdk_hash': sdkHash,
      'options': {
        'user_id': options?.userId,
        'application_process_name': options?.applicationProcessName,
        'user_profile': _profileToMap(options?.userProfile),
        'params': _paramsToMap(options?.params),
        'extension': _extensionsToMap(options?.extensions),
        'w': 'flutter',
      },
    });
  }

  static void showCatalog([PlaytimeParams? params]) async {
    return _channel.invokeMethod('showCatalog', {
      'params': _paramsToMap(params),
    });
  }

  static Future<bool?> canShowCatalog() async {
    return _channel.invokeMethod('canShowCatalog');
  }

  static Future<int?> doPayout([PlaytimeParams? params]) async {
    return _channel.invokeMethod('doPayout', {
      'params': _paramsToMap(params),
    });
  }

  static Future<void> setUAParams(PlaytimeParams params) async {
    return _channel.invokeMethod("setUAParams", {
      'params': _paramsToMap(params),
    });
  }

  static Future<Map?> requestRewards([PlaytimeParams? params]) async {
    return _channel.invokeMapMethod('requestRewards', {
      'params': _paramsToMap(params),
    });
  }

  static Future<void> sendTeaserShownEvent([PlaytimeParams? params]) async {
    return _channel.invokeMethod('sendEvent', {
      'event': _EVENT_TEASER_SHOWN,
      'extra': null,
      'params': _paramsToMap(params),
    });
  }

  static Future<int?> getVersion() async {
    return _channel.invokeMethod('getVersion');
  }

  static Future<String?> getVersionName() async {
    return _channel.invokeMethod('getVersionName');
  }

  static Future<bool?> isInitialized() async {
    return _channel.invokeMethod('isInitialized');
  }

  static Future<bool?> hasAcceptedTOS() async {
    return _channel.invokeMethod('hasAcceptedTOS');
  }

  static Future<bool?> hasAcceptedUsagePermission() async {
    return _channel.invokeMethod('hasAcceptedUsagePermission');
  }

  static Future<String?> getUserId() async {
    return _channel.invokeMethod('getUserId');
  }

  static Map _paramsToMap(PlaytimeParams? params) {
    return {
      'ua_network': params?.uaNetwork,
      'ua_channel': params?.uaChannel,
      'ua_sub_publisher_cleartext': params?.uaSubPublisherCleartext,
      'ua_sub_publisher_encrypted': params?.uaSubPublisherEncrypted,
      'placement': params?.placement,
    };
  }

  static Map _extensionsToMap(PlaytimeExtensions? extensions) {
    return {
      'subId1': extensions?.subId1,
      'subId2': extensions?.subId2,
      'subId3': extensions?.subId3,
      'subId4': extensions?.subId4,
      'subId5': extensions?.subId5
    };
  }

  static Map? _profileToMap(PlaytimeUserProfile? userProfile) {
    if (userProfile == null) {
      return null;
    }
    return {
      'gender': userProfile.gender?.toString().toLowerCase(),
      'birthday': userProfile.birthday?.millisecondsSinceEpoch,
    };
  }
}

class PlaytimeOptions {
  String? userId;
  String? applicationProcessName;
  PlaytimeUserProfile? userProfile;
  PlaytimeParams? params;
  PlaytimeExtensions? extensions;
}

class PlaytimeExtensions {
  String? subId1;
  String? subId2;
  String? subId3;
  String? subId4;
  String? subId5;
}

class PlaytimeParams {
  String? uaNetwork;
  String? uaChannel;
  String? uaSubPublisherCleartext;
  String? uaSubPublisherEncrypted;
  String? placement;
}

class PlaytimeUserProfile {
  PlaytimeGender? gender;
  DateTime? birthday;
}

enum PlaytimeGender {
  MALE,
  FEMALE,
  UNKNOWN,
}
