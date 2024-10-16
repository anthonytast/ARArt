//
//  DrawingImagePreviewView.swift
//  SSC24v2
//
//  Created by Anthony Tast on 2/21/24.
//

import SwiftUI

struct DrawingImagePreviewView: View {
    var capturedImage: UIImage?
    
    var body: some View {
        VStack {
            if let image = capturedImage {
                VStack {
                    Text("Here's a quick preview of how your drawing will look when put in Augmented Reality.\nKeep in mind that there will be no border or white background.")
                        .font(.title2)
                        .padding()
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .border(Color.black, width: 5)
                        .padding()
                }
            } else {
                Text("Draw something in the drawing view first...")
                    .font(.title2)
                    .bold()
                    .padding()
            }
        }
        .navigationTitle("Drawing Image Preview")
    }
}


