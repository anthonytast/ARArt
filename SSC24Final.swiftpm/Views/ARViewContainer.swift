//
//  SwiftUIView.swift
//  
//
//  Created by Anthony Tast on 2/23/24.
//

import SwiftUI

struct ARViewContainer: View {
    var capturedImage: UIImage?
    var body: some View {
        ZStack{
            AugmentedRealityView(capturedImage: capturedImage)
                .ignoresSafeArea(.all)
            VStack {
                Text("Tap the screen where you want your image to appear. Tap again to remove the image.")
                    .font(.title3)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color.white)
                    .opacity(0.5)
                    .cornerRadius(8)
                Spacer()
            }
        }
    }
}
