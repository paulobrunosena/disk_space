import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'disk_space_platform_interface.dart';

/// An implementation of [DiskSpacePlatform] that uses method channels.
class MethodChannelDiskSpace extends DiskSpacePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('disk_space');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
  @override
  Future<String?> getFreeSpace() async {
    final freeSpace = await methodChannel.invokeMethod<String>('getFreeSpace');
    return freeSpace;
  }
}
