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
    @State private var showingInstructions: Bool = false
    var body: some View {
        
        if !showingInstructions {
            VStack(alignment: .center) {
                Image("imgMenu")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                Button("Vamos nessa!") {
                    showingInstructions = true
                }
                .frame(width: 280, height: 50)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Spacer(minLength: 120)
                
                
            }
            
        }
        
        else {
            InstructionsView()
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
                    if let pocaoVermelha = scene.findEntity(named: "pocaoVermelhaObj") {
                        entity.addChild(pocaoVermelha)
                        arview?.scene.addAnchor(entity)
                    }
                }
            }
            
            if let imageName = imageAnchor.name, imageName == "pocaoAmarela" {
                let entity = AnchorEntity(anchor: imageAnchor)
                
                if let scene = try? Experience.loadPocaoAmarela() {
                    if let pocaoAmarela = scene.findEntity(named: "pocaoAmarelaObj") {
                        entity.addChild(pocaoAmarela)
                        arview?.scene.addAnchor(entity)
                    }
                }
            }
            
            if let imageName = imageAnchor.name, imageName == "pocaoAzul" {
                let entity = AnchorEntity(anchor: imageAnchor)
                
                if let scene = try? Experience.loadPocaoAzul() {
                    if let pocaoAzul = scene.findEntity(named: "pocaoAzulObj") {
                        entity.addChild(pocaoAzul)
                        arview?.scene.addAnchor(entity)
                    }
                }
            }
            
            if let imageName = imageAnchor.name, imageName == "pocaoLaranja" {
                let entity = AnchorEntity(anchor: imageAnchor)
                
                if let scene = try? Experience.loadPocaoLaranja() {
                    if let pocaoLaranja = scene.findEntity(named: "pocaoLaranjaObj") {
                        entity.addChild(pocaoLaranja)
                        arview?.scene.addAnchor(entity)
                    }
                }
            }
            
            if let imageName = imageAnchor.name, imageName == "pocaoVerde" {
                let entity = AnchorEntity(anchor: imageAnchor)
                
                if let scene = try? Experience.loadPocaoVerde() {
                    if let pocaoVerde = scene.findEntity(named: "pocaoVerdeObj") {
                        entity.addChild(pocaoVerde)
                        arview?.scene.addAnchor(entity)
                    }
                }
            }
            
            if let imageName = imageAnchor.name, imageName == "pocaoRoxa" {
                let entity = AnchorEntity(anchor: imageAnchor)
                
                if let scene = try? Experience.loadPocaoRoxa() {
                    if let pocaoRoxa = scene.findEntity(named: "pocaoRoxaObj") {
                        entity.addChild(pocaoRoxa)
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
