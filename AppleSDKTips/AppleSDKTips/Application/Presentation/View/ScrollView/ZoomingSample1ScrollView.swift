//
//  ZoomingSample1ScrollView.swift
//  AppleSDKTips
//
//  Copyright © 2017年 YI201610. All rights reserved.
//

import UIKit

class ZoomingSample1ScrollView: UIScrollView {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
        
        self.panGestureRecognizer.minimumNumberOfTouches = 1
        self.panGestureRecognizer.allowedTouchTypes = [UITouchType.direct.rawValue as NSNumber]
        self.pinchGestureRecognizer?.allowedTouchTypes = [UITouchType.direct.rawValue as NSNumber]
    }
    
    weak var viewController: UIViewController?
    
    class func loadFromXib() -> ZoomingSample1ScrollView {
        let xibName = NSStringFromClass(self).components(separatedBy: ".").last! as String
        let xib = UINib(nibName: xibName, bundle: nil)
        let view: ZoomingSample1ScrollView = xib.instantiate(withOwner: nil, options: nil).first as! ZoomingSample1ScrollView
        
        return view
    }

    
}

extension ZoomingSample1ScrollView: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        guard let view = thumbnailImageView else { return nil }
        return view
    }
}
