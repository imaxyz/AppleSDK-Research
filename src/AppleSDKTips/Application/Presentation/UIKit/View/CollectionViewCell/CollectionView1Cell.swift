//
//  CollectionView1Cell.swift
//  AppleSDKTips
//

import UIKit

class CollectionView1Cell: UICollectionViewCell {
    
    
    @IBOutlet weak var label: UILabel!
    
    //---------------------------------------------
    // MARK: - Public
    
    func setText(message: String) {
        label.text = message
    }
}
