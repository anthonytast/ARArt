//
//  SwiftUIView.swift
//  
//
//  Created by Anthony Tast on 2/24/24.
//

import SwiftUI

struct EmptyCameraViewContainer: View {
    var capturedImage: UIImage?
    var body: some View {
        ZStack {
            EmptyCameraView()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("Before entering AR, aim your device at the vertical plane (e.g. a wall) where you would like to place your image. Stand a few feet back from the plane. Be sure to hold your device straight. Then, enter the AR view.")
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .frame(width: 500)
                    .padding()
                    .background(Color.white)
                    .opacity(0.5)
                    .cornerRadius(8)
                Spacer()
                NavigationLink(destination: ARViewContainer(capturedImage: capturedImage)) {
                    Text("Enter Augmented Reality")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
            }
            }
        }
    }
}

