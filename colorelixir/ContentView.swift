//
//  ContentView.swift
//  colorelixir
//
//  Created by Celso Eduardo Muza Ferreira on 03/06/22.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    var body: some View {
        MenuView()
    }
}

struct MenuView: View {
    @State var isActive : Bool = false
    @State private var showingGame: Bool = false
    var body: some View {
   

        NavigationView {
            VStack(alignment: .center) {
                MenuContentView()
                    .navigationTitle("")
                            
                
                Image("imgMenu")
                .scaledToFit()
                .padding()
                
                
                NavigationLink(destination: GameView(gameIsActive: self.$isActive),isActive: self.$isActive, label: {
                    Text("Vamos Nessa!")
                        .bold()
                        .frame(width: 280, height: 50)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        
                })
                
                Spacer(minLength: 120)
                
                

        if !showingGame {
            NavigationView {
                VStack(alignment: .center) {
                    MenuContentView()
                        .navigationTitle("")
                                
                    
                    
                    Image("imgMenu")
                    //.resizable()
                    //.frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.3)
                    .scaledToFit()
                    .padding()
                    
                    Button("Start") {
                        showingGame = true
                    }
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
//                    NavigationLink(destination: { GameView() } ,isActive: $isActive, label: {
//                        Text("Start")
//                            .bold()
//                            .frame(width: 280, height: 50)
//                            .background(Color.black)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//
//
//                    })
                    
                    
                    Spacer(minLength: 120)
                    
                    
                }

            }
        }
        
        else {
            GameView()
        }
    }
}



struct MenuContentView: View {
    var body: some View {
            VStack {
                Text("")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .lineLimit(.max)
            }

    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        let configuration = ARImageTrackingConfiguration()
        
        if let imagesToTrack = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: Bundle.main) {
            configuration.trackingImages = imagesToTrack
            configuration.maximumNumberOfTrackedImages = 8
        }
        
        arView.session.run(configuration)
        arView.session.delegate = context.coordinator
        context.coordinator.arview = arView
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> SectionDelegate {
        SectionDelegate()
    }
    
}

class SectionDelegate: NSObject, ARSessionDelegate {
    weak var arview: ARView?
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        for anchor in anchors {
            guard let imageAnchor = anchor as? ARImageAnchor else { return }
            
            if let imageName = imageAnchor.name, imageName == "pocaoVermelha" {
                let entity = AnchorEntity(anchor: imageAnchor)
                
                if let scene = try? Experience.loadPocaoVermelha() {
                    if let dice = scene.findEntity(named: "pocaoVermelhaObjt") {
                        entity.addChild(dice)
                        arview?.scene.addAnchor(entity)
                    }
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
