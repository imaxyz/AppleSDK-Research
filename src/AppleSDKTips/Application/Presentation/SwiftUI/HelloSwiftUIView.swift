//
//  HelloSwiftUIView.swift
//  AppleSDKTips
//
//  Created by imaxyz on 2020/05/24.
//  Copyright © 2020 imaxyz. All rights reserved.
//

import SwiftUI

// 要iOS13以降
struct HelloSwiftUIView: View {

    /*
    SwiftUIでは、body要素に、
    * content
    * layout
    * behavior
    を定義する。
    ------------
     bodyは、単一のViewを返す
    */
    var body: some View {
        
        VStack {
            
            // MapView
            SomeMapView()
//                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            //Circle
            CircleImageView()
                .offset(y: -130)    // 上部に130pt上にずらす
                .padding(.bottom, -130) // 底辺を130pt上にずらす
            
            // 垂直要素を構成
            VStack(alignment: .leading) {
                Text("タイトル文言: Hello, SwiftUI!")
                    .font(.title)
                
                // 水平要素を構成
                HStack {
                    Text("サブ文言 - その1")
                        .font(.subheadline)
                    
                    // スペーサーを挿入して、画面幅全体を使う
                    Spacer()
                    
                    Text("サブ文言 - その2")
                        .font(.subheadline)

                }
            }
            .padding()  //全体構成に対して、paddingを付加
            
            //このSpacerを挿入することで、合成物の配置が上詰めになる
            Spacer()
        }
        .background(Color.green)

    }
}


struct HelloSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HelloSwiftUIView()
            .padding()
    }
}
