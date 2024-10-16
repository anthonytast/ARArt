import SwiftUI
import PencilKit

struct ContentView: View {
    
    @State private var capturedImage: UIImage?
    @State private var canvasView = PKCanvasView()
    
    var body: some View {
       NavigationView {
           List {
               NavigationLink(destination: WelcomeView()) {
                   Text("Welcome")
               }
               NavigationLink(destination: DrawingView(canvasView: $canvasView, capturedImage: $capturedImage)) {
                   Text("Drawing Area")
               }
               NavigationLink(destination: DrawingImagePreviewView(capturedImage: capturedImage)) {
                   Text("Drawing Image Preview") }

               NavigationLink(destination: EmptyCameraViewContainer(capturedImage: capturedImage)) {
                   Text("Augmented Reality")
               }
               NavigationLink(destination: ConclusionView()) {
                   Text("Conclusion")
               }
           }
           .navigationTitle("AR Art")
       }
    }
}
