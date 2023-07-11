import 'disk_space_platform_interface.dart';

class DiskSpace {
  Future<String?> getPlatformVersion() {
    return DiskSpacePlatform.instance.getPlatformVersion();
  }

  Future<String?> getFreeSpace() {
    return DiskSpacePlatform.instance.getFreeSpace();
  }
}
