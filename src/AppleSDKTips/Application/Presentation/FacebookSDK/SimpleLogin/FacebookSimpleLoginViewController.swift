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
            
            /*
             /**
               the set of permissions granted by the user in the associated request.

              inspect the token's permissions set for a complete list.
              */
             @property (copy, nonatomic) NSSet<NSString *> *grantedPermissions;

             /**
               the set of permissions declined by the user in the associated request.

              inspect the token's permissions set for a complete list.
              */
             @property (copy, nonatomic) NSSet<NSString *> *declinedPermissions;
             */
            
            if ((error) != nil) {
                 print("[FBSDK Debug]Process error");
            } else if ((result?.isCancelled) == true) {
                 print("[FBSDK Debug]Cancelled");
            } else {
                 print("[FBSDK Debug]Logged in");
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
