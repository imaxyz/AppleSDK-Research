//
//  Tutorial2Row.swift
//  AppleSDKTips
//
//  Created by imaxyz on 2020/06/16
//  Copyright © 2020 imaxyz. All rights reserved.
//

import SwiftUI


/// FIXME: 適切な位置に移動
/// Landmarkモデル・インスタンスの配列
let landmarkData: [Landmark] = load(filename: "tutorial1.json")

/// localhostに配置したjsonファイルを読み込み、デコードして辞書データを返す
/// - Parameter filename: jsonファイルのパス
/// - Returns: デコードされたオブジェクトのリスト
func load<T: Decodable>(filename: String) -> T {
    
    /// ファイルオープン
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    /// ファイルからjsonデータを読み込み
    let json_buffer: Data
    do {
        json_buffer = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    // jsonデータをオブジェクトにデコードして返す
    do {
        let decoder = JSONDecoder()
        let decodes = try decoder.decode(T.self, from: json_buffer)
        return decodes
        
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


struct LandmarkRowView: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            Text(String(landmark.id) + landmark.name)
        }
    }
}

struct Tutorial2Row_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRowView(landmark: landmarkData[0])
    }
}
