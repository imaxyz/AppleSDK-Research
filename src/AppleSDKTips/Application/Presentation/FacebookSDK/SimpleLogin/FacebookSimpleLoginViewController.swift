//
//  FacebookSimpleLoginViewController.swift
//  AppleSDKTips
//  
//  Created by imaxyz on 2020/08/27
//  Copyright © 2020 imaxyz. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class FacebookSimpleLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    /// Facebook ログインボタンを選択した
    /// - Parameter sender: UIButton
    @IBAction func didTapFacebookLoginButton(_ sender: UIButton) {

        // Facebook Login ManagerでFacebookログイン
        let permissions: [String] = []
        let facebookLoginManager = LoginManager()

        // 注: Info.plistにFacebook AppIDを設定していないと、SDKから例外が発行される
        facebookLoginManager.logIn(permissions: permissions, from: self){ result, error in
            
            if ((error) != nil) {
                print("[FBSDK Debug] Process error", error as Any)
            } else if ((result?.isCancelled) == true) {
                 print("[FBSDK Debug] Cancelled");
            } else {
                 print("[FBSDK Debug] Logged in");
                self.dismiss(animated: true, completion: {
                    print("[FBSDK Debug] dismissed");
                })
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
