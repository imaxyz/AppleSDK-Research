//
//  CircleImageView.swift
//  AppleSDKTips
//
//  Created by imaxyz on 2020/05/25.
//  Copyright © 2020 imaxyz. All rights reserved.
//

import SwiftUI

struct CircleImageView: View {
    var image: Image
    
    var body: some View {
        image
            .frame(width: 250,
                   height: 250,
                   alignment: Alignment.center)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 10)
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(image: Image("IMG_3513"))
    }
}
