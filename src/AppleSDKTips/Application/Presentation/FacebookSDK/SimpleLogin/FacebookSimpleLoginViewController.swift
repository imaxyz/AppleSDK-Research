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

        // Do any additional setup after loading the view.
        let loginButton = FBLoginButton()
        loginButton.center = view.center
        view.addSubview(loginButton)
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
