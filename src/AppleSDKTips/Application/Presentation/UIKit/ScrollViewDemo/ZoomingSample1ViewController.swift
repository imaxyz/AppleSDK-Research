//
//  ZoomingSample1ViewController.swift
//  AppleSDKTips
//
//  Copyright © 2017年 YI201610. All rights reserved.
//

import UIKit

class ZoomingSample1ViewController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let imageList = ["20150221AutoLayout", "blue120x320", "green240x120", "red240x120"]
        
        scrollView.contentSize = CGSize(width: CGFloat(Int(scrollView.frame.width)*imageList.count), height: scrollView.frame.height)
        
        var idx:CGFloat = 0
        for imageName in imageList {
            
            let imageObject = UIImage(named: imageName)
            let subScrollView = ZoomingSample1ScrollView.loadFromXib()
            subScrollView.thumbnailImageView.image = imageObject
            subScrollView.viewController = self
            subScrollView.frame = CGRect(x: scrollView.frame.size.width*idx, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
            
            scrollView.addSubview(subScrollView)

            idx+=1.0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didSelectBackButton(_ sender: UIButton) {
        dismiss(animated: true, completion: {})
    }

}
