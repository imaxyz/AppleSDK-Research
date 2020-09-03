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

        //T##LoginManagerLoginResultBlock?##LoginManagerLoginResultBlock?##(LoginManagerLoginResult?, Error?) -> Void
        let permissions: [String] = []
        let facebookLoginManager = LoginManager()
        
        facebookLoginManager.logIn(permissions: permissions, from: self){ result, error in
            print("result: %s", result as Any)
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
