//
//  AppDelegate.swift
//  AppleSDKTips
//
//

import UIKit

// Amplify関連のライブラリをインポート
import Amplify
import AWSDataStorePlugin

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    /// AWS Amplify SDKの初期化
    func configureAmplify() {
        
        // Amplifyのログレベルを変更
        Amplify.Logging.logLevel = .debug

        let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())
        do {
            try Amplify.add(plugin: dataStorePlugin)
            try Amplify.configure()
            print("*** Initialized Amplify");
       
        } catch {
            // simplified error handling for the tutorial
            print("*** Could not initialize Amplify: \(error)")
        }
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        // AWS Amplify SDKの初期化
        configureAmplify()

        // Facebook SDKの初期化
        FacebookDelegate.start_sdk(application: application, didFinishLaunchingWithOptions: launchOptions)

        return true
    }
    
    func application(_ application: UIApplication,open url: URL,sourceApplication: String?,annotation: Any) -> Bool {
        //Facebook SDKのコードを実行する
        return FacebookDelegate.open_url(application: application,
                                         url: url,
                                         sourceApplication: sourceApplication,
                                         annotation: annotation)
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        //Facebook SDKのコードを実行する
        FacebookDelegate.did_become_active()
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

