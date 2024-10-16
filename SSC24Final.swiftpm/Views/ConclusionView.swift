//
//  ConclusionView.swift
//  SSC24v2
//
//  Created by Anthony Tast on 2/21/24.
//

import SwiftUI

struct ConclusionView: View {
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
            Text("I hope you enjoyed this Drawing and Augmented Reality experience! I encourage you to dive further into artistic creation and all of the potential that Augmented Reality has to offer.")
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding(20)
            
            Spacer()
        }
        .navigationTitle("Conclusion")
    }
}
