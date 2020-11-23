//
//  LandmarksSwiftUIView.swift
//  AppleSDKTips
//  
//  Created by imaxyz on 2020/11/22
//  Copyright © 2020 imaxyz. All rights reserved.
//

import SwiftUI

struct LandmarksSwiftUIView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("＜お気に入りの地名＞")
                .font(.title)
            HStack {
                Text("＜地名の場所の概要＞")
                    .font(.subheadline)
                Spacer()
                Text("＜地名＞")
            }
        }.padding()
            
    }
}

struct LandmarksSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarksSwiftUIView()
        }
    }
}
