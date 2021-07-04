//
//  AmplifyDelegate.swift
//
//  Created on 2021/05/28
//  Copyright © 2021 imaxyz. All rights reserved.
//

import Foundation

import Amplify
import AWSDataStorePlugin

class AmplifyDelegate: NSObject {
    
    /// AWS Amplify SDKの初期化
    class func configureAmplify() {
        
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
}
