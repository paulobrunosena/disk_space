import 'package:disk_space/disk_space.dart';
import 'package:disk_space/disk_space_method_channel.dart';
import 'package:disk_space/disk_space_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDiskSpacePlatform
    with MockPlatformInterfaceMixin
    implements DiskSpacePlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> getFreeSpace() {
    throw UnimplementedError();
  }
}

void main() {
  final DiskSpacePlatform initialPlatform = DiskSpacePlatform.instance;

  test('$MethodChannelDiskSpace is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDiskSpace>());
  });

  test('getPlatformVersion', () async {
    DiskSpace diskSpacePlugin = DiskSpace();
    MockDiskSpacePlatform fakePlatform = MockDiskSpacePlatform();
    DiskSpacePlatform.instance = fakePlatform;

    expect(await diskSpacePlugin.getPlatformVersion(), '42');
  });
}
