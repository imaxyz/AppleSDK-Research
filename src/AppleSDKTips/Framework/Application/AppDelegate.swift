//
//  AppDelegate.swift
//  AppleSDKTips
//
//

import UIKit

// Amplify関連のライブラリをインポート
import Amplify
import AmplifyPlugins

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Amplifyのログレベルを変更
        Amplify.Logging.logLevel = .debug

        // Amplifyの初期化
        let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())
        do {
           try Amplify.add(plugin:dataStorePlugin)
           try Amplify.configure()
           print("*** OK: Initialized Amplify! ***");
        } catch {
           print("xxx Could not initialize Amplify: \(error)")
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

