//
//  WelcomeView.swift
//  SSC24v2
//
//  Created by Anthony Tast on 2/21/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack{
            Spacer()
            
            Text("AR Art")
                .font(.title)
                .font(.system(size: 50))
                .bold()
                .foregroundColor(Color(.label))
            
            HStack{
                VStack{
                    Image("DrawPreview")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
                VStack{
                    Image("ARPreview")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
            }
            Spacer()
            Text("Welcome to AR Art! In this app, you will create a drawing and then project it on a vertical surface in Augmented Reality. You will start in the Drawing Area where you will use your Apple Pencil to draw on the canvas. The drawing will be turned into an image, which you can preview in the Drawing Image Preview. Then, you will enter the Augmented Reality portion where you will be instructed on how to place your drawing on a vertical surface.")
                .font(.title3)
                .padding(20)
            
            Spacer()
        }
        .navigationTitle("Introduction")
    }
}
