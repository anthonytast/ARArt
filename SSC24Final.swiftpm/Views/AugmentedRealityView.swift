//
//  SwiftUIView.swift
//
//
//  Created by Anthony Tast on 2/23/24.
//

import SwiftUI
import ARKit

struct AugmentedRealityView: UIViewRepresentable {
    
    //image will be passed in later
    var capturedImage: UIImage?
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(capturedImage: capturedImage)
        }
        
        func makeUIView(context: Context) -> ARSCNView {
            let arView = ARSCNView()
            arView.delegate = context.coordinator
            let scene = SCNScene()
            arView.scene = scene
            arView.autoenablesDefaultLighting = true
//            arView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
            
            let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:)))
            arView.addGestureRecognizer(tapGesture)
            
            context.coordinator.arView = arView
            
            return arView
        }
        
        func updateUIView(_ uiView: ARSCNView, context: Context) {
            let configuration = ARWorldTrackingConfiguration()
            configuration.planeDetection = [.vertical]
            uiView.session.run(configuration)
        }
        
        class Coordinator: NSObject, ARSCNViewDelegate {
            var arView: ARSCNView?
            var imageNode: SCNNode?
            var capturedImage: UIImage?
            
            init(capturedImage: UIImage?) {
                        self.capturedImage = capturedImage
                    }
            
            @objc func handleTap(_ gesture: UITapGestureRecognizer) {
                guard let arView = arView else { return }
                
                if let existingImageNode = imageNode {
                    existingImageNode.removeFromParentNode()
                    imageNode = nil
                } else {
                    let hitTestResults = arView.hitTest(gesture.location(in: arView), types: .existingPlaneUsingExtent)
                    if let hitTestResult = hitTestResults.first(where: { result in result.anchor is ARPlaneAnchor }) {
                        let anchorTransform = hitTestResult.worldTransform
                        let position = SCNVector3(anchorTransform.columns.3.x, anchorTransform.columns.3.y, anchorTransform.columns.3.z)
                        imageNode = createImageNode()
                        imageNode?.position = position
                        arView.scene.rootNode.addChildNode(imageNode!)
                    }
                }
            }
            
            private func createImageNode() -> SCNNode {
                let image: UIImage
                if let capturedImage = self.capturedImage {
                    image = capturedImage
                } else {
                    image = UIImage(systemName: "photo") ?? UIImage()
                }

                let imageMaterial = SCNMaterial()
                imageMaterial.diffuse.contents = image
                let imageNode = SCNNode(geometry: SCNPlane(width: 0.2, height: 0.2))
                imageNode.geometry?.firstMaterial = imageMaterial
                return imageNode
            }
        }
    }
