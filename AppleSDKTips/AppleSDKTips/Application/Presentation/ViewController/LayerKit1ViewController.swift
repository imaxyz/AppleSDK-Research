//
//  LayerKit1ViewController.swift
//  AppleSDKTips
//

import UIKit

class LayerKit1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func didSelectTouchBarButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: {})
    }
}
