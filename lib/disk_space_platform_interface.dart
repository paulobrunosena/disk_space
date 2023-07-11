import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'disk_space_method_channel.dart';

abstract class DiskSpacePlatform extends PlatformInterface {
  /// Constructs a DiskSpacePlatform.
  DiskSpacePlatform() : super(token: _token);

  static final Object _token = Object();

  static DiskSpacePlatform _instance = MethodChannelDiskSpace();

  /// The default instance of [DiskSpacePlatform] to use.
  ///
  /// Defaults to [MethodChannelDiskSpace].
  static DiskSpacePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DiskSpacePlatform] when
  /// they register themselves.
  static set instance(DiskSpacePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getFreeSpace() {
    throw UnimplementedError('freeSpace() has not been implemented.');
  }
}
