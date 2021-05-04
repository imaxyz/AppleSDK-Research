//
//  FacebookDelegate.swift
//  AppleSDKTips
//
//  Created by imaxyz on 2021/05/04.
//  Copyright © 2021 imaxyz. All rights reserved.
//

import Foundation
import FBSDKCoreKit

class FacebookDelegate: NSObject {
    
    class func start_sdk(application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Void {
        
        // Facebook SDKのバージョンをログに出力
        print("[FBSDK sdkVersion]" + Settings.sdkVersion)
        print("[FBSDK defaultGraphAPIVersion]" + Settings.defaultGraphAPIVersion)
                
        // 以下のコードは、Facebook SDKにつながっている。Facebook SDKを起動する。
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    class func open_url(application: UIApplication, url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        //Facebook SDKのコードを実行する
        return ApplicationDelegate.shared.application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
}
