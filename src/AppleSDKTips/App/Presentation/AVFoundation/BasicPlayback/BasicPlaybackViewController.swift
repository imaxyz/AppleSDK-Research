//
//  BasicPlaybackViewController.swift
//  AppleSDKTips
//
//  Copyright © 2019 YI201610. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class BasicPlaybackViewController: UIViewController {

    //---------------------------------------------
    // MARK: - Lifecyle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BasicPlaybackViewController.setupAudioSession()
    }
    
    //---------------------------------------------
    // MARK: - Action
    
    @IBAction func didSelectPlayVideoButton(_ sender: UIButton) {
        
        //鳥のflutterが観れるサンプル
        let urlString = "https://devimages-cdn.apple.com/samplecode/avfoundationMedia/AVFoundationQueuePlayer_HLS2/master.m3u8"

        playSampleMediaInAVPlayerViewControllerWithMediaSourceURLSTring(urlString: urlString)
        
    }
    
    //---------------------------------------------
    // MARK: - Private

    
    /// AudioSessionを初期化する
    class func setupAudioSession() -> Void {
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSession.Category(rawValue: convertFromAVAudioSessionCategory(AVAudioSession.Category.playback)))
        }
        catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
    }
    
    func playSampleMediaInAVPlayerViewControllerWithMediaSourceURLSTring(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        // HTTP Live Streaming URLを指定してAVPlayerを生成する
        let player = AVPlayer(url: url)
        
        // 既製品のAVPlayerViewControllerインスタンスを生成し、AVPlayerインスタンスの参照を渡す。
        let controller = AVPlayerViewController()
        controller.player = player
        
        // モーダルでAVPlayerViewControllerインスタンスを表示し、AVPlayerインスタンスのplay()メソッドを実行する。
        present(controller, animated: true) {
            player.play()
        }
    }
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
	return input.rawValue
}
