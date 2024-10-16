
import SwiftUI
import PencilKit

struct DrawingView: View {

    @State var rendition: Rendition?
    @Binding var canvasView: PKCanvasView
    @State private var isSharing = false
    @State private var isSelectingMasterpiece = false
    @State private var isShowingPreview = false
    @State private var isShowingPreviewMessage = false
    @Binding var capturedImage: UIImage?

    
  var body: some View {
      ZStack {
          Color.mint
              .edgesIgnoringSafeArea(.all)
          
          VStack {
   //           HStack{
   //               Spacer()
                  Text("Draw Something ✍️🤔")
                      .font(.title)
                      .bold()
                      .padding()
   //               Spacer()
   //           }
              CanvasView(canvasView: $canvasView, onSaved: saveDrawing)
                  .padding(20)
              Button(action: deleteDrawing) {
                  Text("Clear Canvas")
                                  .foregroundColor(.white)
                                  .padding()
                                  .background(Color.blue)
                                  .cornerRadius(8)
              }
              .padding()
          }
      }
  }
}

extension DrawingView {
    func saveDrawing() {
        let image = canvasView.drawing.image(
            from: canvasView.bounds, scale: UIScreen.main.scale)
        let rendition = Rendition(
            title: "Drawing",
            drawing: canvasView.drawing,
            image: image)
        self.rendition = rendition
        self.capturedImage = image
    }
    
    func deleteDrawing() {
        canvasView.drawing = PKDrawing()
    }
}
