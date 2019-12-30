import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
  _ application: UIApplication,
   didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
   )  -> Bool {
    GMSServices.provideAPIKey("AIzaSyD-ahLxTBaAfKZpcAGGCvfagd4S3x6aqzw")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
