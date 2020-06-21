//
//  Tutorial2Row.swift
//  AppleSDKTips
//
//  Created by imaxyz on 2020/06/16
//  Copyright © 2020 imaxyz. All rights reserved.
//

import SwiftUI


/// FIXME: 適切な位置に移動
let landmarkData: [Landmark] = load("tutorial1.json")

/// TODO: Cocableプロトコルの復習
/// - Parameter filename: <#filename description#>
/// - Returns: <#description#>
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


struct LandmarkRowView: View {
    
    var landmark: Landmark
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Tutorial2Row_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRowView(landmark: landmarkData[0])
    }
}
