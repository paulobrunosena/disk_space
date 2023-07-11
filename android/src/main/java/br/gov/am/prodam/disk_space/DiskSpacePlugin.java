package br.gov.am.prodam.disk_space;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import android.os.Environment;
import android.os.StatFs;
/** DiskSpacePlugin */
public class DiskSpacePlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "disk_space");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("getFreeSpace")) {
      String freeSpace = getFreeSpace();
      result.success(freeSpace);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  private String getFreeSpace() {
    final long SIZE_KB = 1024L;
    final long SIZE_GB = SIZE_KB * SIZE_KB * SIZE_KB;
    long availableSpace;
    StatFs stat = new StatFs(Environment.getExternalStorageDirectory().getPath());
    availableSpace = stat.getAvailableBlocksLong() * stat.getBlockSizeLong();
    return String.valueOf(availableSpace / SIZE_GB);
  }
}
