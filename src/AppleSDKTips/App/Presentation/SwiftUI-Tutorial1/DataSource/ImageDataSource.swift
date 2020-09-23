//
//  ImageDataSource.swift
//  AppleSDKTips
//  
//  Created by imaxyz on 2020/06/26
//  Copyright © 2020 imaxyz. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

/// 画像データのDataSource。継承は禁止。
final class ImageDataSource {
    
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]

    fileprivate static var scale = 2
    
    /// Singletonオブジェクト
    static var shared = ImageDataSource()
    
    /// SwiftUIのImageオブジェクトを生成して返す
    /// - Parameter name: 画像の名称
    /// - Returns: SwiftUIのImageオブジェクト
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        
        return Image(images.values[index],
                     scale: CGFloat(ImageDataSource.scale),
                     label: Text(name))
    }

    static func loadImage(name: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(name).jpg from main bundle.")
        }
        return image
    }
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) { return index }
        
        images[name] = ImageDataSource.loadImage(name: name)
        return images.index(forKey: name)!
    }
}


