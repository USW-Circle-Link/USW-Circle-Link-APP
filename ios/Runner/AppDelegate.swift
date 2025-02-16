import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  override func application(
    _ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
    fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
  ) {
    print("didReceiveRemoteNotification")
    let state = UIApplication.shared.applicationState
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let notificationChannel = FlutterMethodChannel(name: "com.usw.circle_link.notifications", binaryMessenger: controller.binaryMessenger)

    switch state {
    case .background:
        print("Background")
        notificationChannel.invokeMethod("storeNotification", arguments: userInfo)
    case .active:
        print("Active")
    case .inactive:
        print("Inactive")
        notificationChannel.invokeMethod("storeNotification", arguments: userInfo)
    default:
        break
    }
  }
}
