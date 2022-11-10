import 'dart:io';

class MobilePlatform {
  static T? switchPlatform<T>({required T android, required T iOS}) {
    if (Platform.isAndroid) {
      return android;
    } else if (Platform.isIOS) {
      return iOS;
    }
    return null;
  }
}
