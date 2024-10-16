//
//  SwiftUIView.swift
//  
//
//  Created by Anthony Tast on 2/24/24.
//

import SwiftUI
import RealityKit
import ARKit

struct EmptyCameraView: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        let configuration = ARWorldTrackingConfiguration()
        arView.session.run(configuration)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {

    }
}
