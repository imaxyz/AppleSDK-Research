//
//  MapUIView.swift
//  AppleSDKTips
//
//  Created by imaxyz on 2020/06/01.
//  Copyright © 2020 imaxyz. All rights reserved.
//

import SwiftUI
import MapKit

struct SomeMapView: UIViewRepresentable {

    //---------------------------------------------
    // MARK: - UIViewRepresentable
    
    /// UIViewを作成する
    /// - Parameter context: <#context description#>
    /// - Returns: <#description#>
    func makeUIView(context: Context) -> MKMapView {
           MKMapView(frame: .zero)
    }

    /// UIViewを更新する
    /// - Parameters:
    ///   - uiView: <#uiView description#>
    ///   - context: <#context description#>
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        let coordinate = CLLocationCoordinate2D(
            latitude: 34.011286, longitude: -116.166868)
        
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        uiView.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    
    /// SomeMapViewはUIViewであるため、ライブモードにしないと表示が更新されない
    
    static var previews: some View {
        SomeMapView()
    }
}
